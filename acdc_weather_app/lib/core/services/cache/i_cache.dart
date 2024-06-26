import 'cache_params.dart';

abstract class Cache {
  Future<bool> setData({required CacheParams params});
  Future<dynamic> getData(String key);
  Future<bool> removeData(String key);
  Future<bool> clearAll();
}
