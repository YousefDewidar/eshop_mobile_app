import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/auth/data/models/user_tokens.dart';

class SecureStorage {
  static final getSecureStorage = getIt.get<FlutterSecureStorage>();

  static Future<void> writeSecureData(String key, String value) async {
    await getSecureStorage.write(key: key, value: value);
  }

  static Future<String?> readSecureData(String key) async {
    return await getSecureStorage.read(key: key);
  }

  static Future<void> saveUserData(
    String accessToken,
    String refreshToken,
  ) async {
    await writeSecureData('accessToken', accessToken);
    await writeSecureData('refreshToken', refreshToken);
  }

  static Future<void> deleteUserData() async {
    await getSecureStorage.deleteAll();
  }

  static Future<UserTokens> getUserData() async {
    final accessToken = await readSecureData('accessToken');
    final refreshToken = await readSecureData('refreshToken');

    return UserTokens(accessToken: accessToken, refreshToken: refreshToken);
  }
}
