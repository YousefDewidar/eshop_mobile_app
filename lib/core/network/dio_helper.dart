import 'package:dio/dio.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/network/api_service.dart';

Future<void> setupDio() async {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final headers = await SecureStorage.getUserTokens();
        options.headers.addAll({
          "Authorization": "Bearer ${headers.accessToken ?? ''}",
        });
        handler.next(options);
      },

      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          final tokens = await SecureStorage.getUserTokens();
          if (tokens.refreshToken == null) return handler.next(error);

          try {
            final response = await dio.post(
              'https://accessories-eshop.runasp.net/api/auth/refresh-token',
              data: {"refreshToken": tokens.refreshToken},
            );
            final newAccess = response.data['accessToken'];
            final newRefresh = response.data['refreshToken'];

            await SecureStorage.saveUserData(newAccess, newRefresh);

            final retryHeaders = {"Authorization": "Bearer $newAccess"};

            final requestOptions = error.requestOptions;
            requestOptions.headers.addAll(retryHeaders);

            final cloneReq = await dio.request(
              requestOptions.path,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
              ),
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );

            return handler.resolve(cloneReq);
          } catch (e) {
            await SecureStorage.deleteUserData();
            return handler.next(error);
          }
        } else {
          return handler.next(error);
        }
      },
    ),
  );

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<ApiService>(ApiService(dio));
}
