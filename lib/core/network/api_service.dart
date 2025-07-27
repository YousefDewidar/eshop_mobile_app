import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const _baseUrl = 'https://accessories-eshop.runasp.net';

  ApiService(this._dio);

  Future<Response> get(String endPoint) => _dio.get("$_baseUrl$endPoint");

  Future<Response> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) => _dio.post("$_baseUrl$endPoint", data: data);

  Future<Response> put(String endPoint, {required Map<String, dynamic> data}) =>
      _dio.put("$_baseUrl$endPoint", data: data);

  Future<Response> delete(String endPoint, {Map<String, dynamic>? data}) =>
      _dio.delete("$_baseUrl$endPoint", data: data);
}
