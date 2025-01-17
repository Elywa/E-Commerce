import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefrence {
  static late SharedPreferences sharedPreference;

  static init() async {
    try {
      sharedPreference = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint("Error initializing SharedPreferences: $e");
    }
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPreference.setInt(key, value);
    } else if (value is bool) {
      return sharedPreference.setBool(key, value);
    } else if (value is double) {
      return sharedPreference.setDouble(key, value);
    } else if (value is String) {
      return sharedPreference.setString(key, value);
    } else {
      return sharedPreference.setStringList(key, value);
    }
  }

  static Future<bool> removeData({required String key}) {
    return sharedPreference.remove(key);
  }

  static Object? getData({required String key}) {
    return sharedPreference.get(key);
  }
}
