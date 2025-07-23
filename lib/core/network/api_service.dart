import 'package:dio/dio.dart';
import 'package:rfaye3/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),

              headers: {'Content-Type': 'application/json'},
              validateStatus: (_) => true,
            ),
          );

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _safeCall(
      () => _dio.post(endpoint, data: data, queryParameters: queryParameters),
    );
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _safeCall(
      () => _dio.get(endpoint, queryParameters: queryParameters),
    );
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    return _safeCall(() => _dio.put(endpoint, data: data));
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    return _safeCall(() => _dio.delete(endpoint, data: data));
  }

  Future<Response> _safeCall(Future<Response> Function() request) async {
    try {
      final response = await request();
      return response;
    } on DioException catch (e) {
      print('DioException: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('Unknown error: $e');
    }
  }
}
