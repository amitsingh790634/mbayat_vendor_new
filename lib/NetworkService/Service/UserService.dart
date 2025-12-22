import 'package:mbayat_user_app/main.dart';

class UserService {
  static bool getBool(String key) {
    return sharedPrefs?.getBool(key) ?? false;
  }

  static setBool(String key, bool value) {
    return sharedPrefs?.setBool(key, value);
  }

  static String getString(String key) {
    return sharedPrefs?.getString(key) ?? '';
  }

  static setString(String key, String value) {
    return sharedPrefs?.setString(key, value);
  }
}
