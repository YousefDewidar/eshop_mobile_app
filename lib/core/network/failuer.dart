import 'package:dio/dio.dart';

abstract class Failuer {
  final String message;
  Failuer({required this.message});

  get error => null;
}

class ServerFailure extends Failuer {
  ServerFailure({required super.message});

  factory ServerFailure.fromError(Object e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ServerFailure(
            message: 'The connection to server time out, please try later',
          );
        case DioExceptionType.sendTimeout:
          return ServerFailure(
            message: 'The connection to server time out, please try later',
          );

        case DioExceptionType.receiveTimeout:
          return ServerFailure(
            message:
                'The receive method from server time out, please try later',
          );

        case DioExceptionType.badCertificate:
          return ServerFailure(message: 'Bad Certificate');

        case DioExceptionType.badResponse:
          return ServerFailure._fromBadResponse(e.response!);

        case DioExceptionType.cancel:
          return ServerFailure(
            message: 'The request canceld, please try another',
          );

        case DioExceptionType.connectionError:
          return ServerFailure(message: 'No internet connection');

        case DioExceptionType.unknown:
          return ServerFailure(
            message: 'Opps, There is a error please try again',
          );
      }
    } else {
      return ServerFailure(message: 'Opps, There is a error please try again');
    }
  }
  factory ServerFailure._fromBadResponse(Response response) {
    if (response.statusCode == 401) {
      return ServerFailure(message: 'Unauthorized');
    }
    
    if ([400, 403].contains(response.statusCode)) {
      final errors = response.data['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final firstErrorList = errors[errors.keys.first];
        if (firstErrorList is List && firstErrorList.isNotEmpty) {
          if (errors.keys.first == 'generalErrors') {
            return ServerFailure(
              message: firstErrorList.first.toString().split(":")[1],
            );
          } else {
            return ServerFailure(message: firstErrorList.first.toString());
          }
        }
      }
      return ServerFailure(message: 'Unknown error occurred');
    } else if (response.statusCode == 429) {
      return ServerFailure(
        message: 'Too many requests, please try again after some time',
      );
    } else if (response.statusCode == 500) {
      return ServerFailure(
        message: 'The problem in a server, please try later',
      );
    } else if (response.statusCode == 404) {
      return ServerFailure(message: 'The request not found');
    } else {
      return ServerFailure(message: 'There is an error please try again');
    }
  }
}
