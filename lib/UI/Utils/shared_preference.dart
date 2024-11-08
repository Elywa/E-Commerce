import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrence {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else {
      return sharedPreferences.setStringList(key, value);
    }
  }

  static Object? getData({required String key}) async {
    return sharedPreferences.get(key);
  }
}
