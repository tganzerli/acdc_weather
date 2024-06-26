import 'dart:convert';
import 'package:acdc_weather_app/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements Cache {
  @override
  Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.get(key);

    if (result != null) {
      try {
        return jsonDecode(result as String);
      } catch (e) {
        return result;
      }
    } else {
      throw CacheException(message: 'No value found for key: $key');
    }
  }

  @override
  Future<bool> setData({required CacheParams params}) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      switch (params.value.runtimeType.toString()) {
        case 'String':
          return await prefs.setString(params.key, params.value);
        case 'int':
          return await prefs.setInt(params.key, params.value);
        case 'bool':
          return await prefs.setBool(params.key, params.value);
        case 'double':
          return await prefs.setDouble(params.key, params.value);
        case 'List<String>':
          return await prefs.setStringList(params.key, params.value);
        default:
          return await prefs.setString(params.key, jsonEncode(params.value));
      }
    } catch (e) {
      throw CacheException(
          message:
              'Failed to save data for key: ${params.key}. Error: ${e.toString()}');
    }
  }

  @override
  Future<bool> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return await prefs.remove(key);
    } catch (e) {
      throw CacheException(
          message:
              'Failed to remove data for key: $key. Error: ${e.toString()}');
    }
  }

  @override
  Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return await prefs.clear();
    } catch (e) {
      throw CacheException(
          message: 'Failed to clear all data. Error: ${e.toString()}');
    }
  }
}
