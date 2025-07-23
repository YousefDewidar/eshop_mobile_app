import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  static const _baseUrl = 'http://accessories-eshop.runasp.net';

  Future<Response> get(String endPoint) async {
    final response = await _dio.get("$_baseUrl$endPoint");
    return response;
  }

  Future<Response> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post("$_baseUrl$endPoint", data: data);
    return response;
  }

  Future<Response> put(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.put("$_baseUrl$endPoint", data: data);
    return response;
  }

  Future<Response> delete(String endPoint) async {
    final response = await _dio.delete("$_baseUrl$endPoint");
    return response;
  }
}
