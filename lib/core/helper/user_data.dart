import 'dart:convert';

import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/authentication/domain/entities/user_entity.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserLocaldata {
  static final SharedPreferences pref = getIt<SharedPreferences>();
  static UserEntity? getUserData() {
    String? userString = pref.getString('user');
    if (userString != null) {
      Map<String, dynamic> userMap = json.decode(userString);
      UserEntity user = UserEntity.fromMap(userMap);
      return user;
    }
    return null;
  }

  static Future<void> setUserData(UserEntity user) async {
    String userString = jsonEncode(user.toMap());

    await pref.setString('user', userString);
  }
}
