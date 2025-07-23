import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkFailure(
            'Connection timeout. Please try again later.',
          );

        case DioExceptionType.badResponse:
          return _handleBadResponse(error);

        case DioExceptionType.cancel:
          return const NetworkFailure('Request was cancelled.');

        case DioExceptionType.connectionError:
          return const NetworkFailure(
            'No internet connection. Please check your network.',
          );

        case DioExceptionType.unknown:
          return const UnknownFailure(
            'Something went wrong. Please try again.',
          );

        default:
          return const UnknownFailure('Unexpected error occurred.');
      }
    } else {
      return const UnknownFailure('An unexpected error occurred.');
    }
  }

  static Failure _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (statusCode == 400 || statusCode == 422) {
      if (data is Map) {
        final message = data['message'] as String? ?? 'Invalid input.';
        final errors = data['errors'];

        if (errors is Map) {
          final errorMessages = <String>[];

          errors.forEach((field, messages) {
            if (messages is List) {
              for (var msg in messages) {
                errorMessages.add('- $field: $msg');
              }
            }
          });

          return ValidationFailure('$message\n${errorMessages.join('\n')}');
        }

        return ValidationFailure(message);
      }

      return const ValidationFailure(
        'Invalid request. Please check your input.',
      );
    }

    if (statusCode == 401) {
      return const ServerFailure('Unauthorized. Please login again.');
    }

    if (statusCode == 403) {
      return const ServerFailure('Forbidden. You do not have permission.');
    }

    if (statusCode == 404) {
      return const ServerFailure('Resource not found.');
    }

    if (statusCode == 500) {
      return const ServerFailure('Server error. Please try again later.');
    }

    return const ServerFailure('Something went wrong with the server.');
  }
}
