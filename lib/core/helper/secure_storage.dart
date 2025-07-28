
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/auth/data/models/user_model.dart';
import 'package:rfaye3/features/auth/data/models/user_tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static final secureStorage = getIt.get<FlutterSecureStorage>();
  static final prefs = getIt.get<SharedPreferences>();

  static Future<void> writeSecureData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  static Future<String?> readSecureData(String key) async {
    return await secureStorage.read(key: key);
  }

  static Future<void> saveUserData(
    String accessToken,
    String refreshToken,
  ) async {
    await writeSecureData('accessToken', accessToken);
    await writeSecureData('refreshToken', refreshToken);

    final decodedToken = JwtDecoder.decode(accessToken);

    await prefs.setString('userEmail', decodedToken['email']);
    await prefs.setString('userName', decodedToken['name']);
    await prefs.setString('userImage', decodedToken['picture']);
  }

  static Future<void> deleteUserData() async {
    await secureStorage.deleteAll();
    await prefs.remove('userEmail');
    await prefs.remove('userName');
    await prefs.remove('userImage');
  }

  static UserModel getUserData() {
    final email = prefs.getString('userEmail');
    final name = prefs.getString('userName');
    final image = prefs.getString('userImage');
    return UserModel(name: name, email: email, image: image);
  }

  static Future<UserTokens> getUserTokens() async {
    final accessToken = await readSecureData('accessToken');
    final refreshToken = await readSecureData('refreshToken');

    return UserTokens(accessToken: accessToken, refreshToken: refreshToken);
  }
}
