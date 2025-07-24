import 'package:dio/dio.dart';
import 'package:rfaye3/token_test.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  static const _baseUrl = 'https://accessories-eshop.runasp.net';

  Future<Response> get(String endPoint) async {
    final response = await _dio.get(
      "$_baseUrl$endPoint",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    return response;
  }

  Future<Response> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    return response;
  }

  Future<Response> put(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.put(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    return response;
  }

  Future<Response> delete(String endPoint, {Map<String, dynamic>? data}) async {
    final response = await _dio.delete(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    return response;
  }
}
