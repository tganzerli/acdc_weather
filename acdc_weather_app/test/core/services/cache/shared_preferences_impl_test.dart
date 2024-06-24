import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/core/services/cache/shared_preferences_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  late SharedPreferencesImpl cache;

  setUp(
    () {
      cache = SharedPreferencesImpl();
    },
  );

  test('Shared preferences - Set String value', () async {
    CacheParams params = CacheParams(key: 'String', value: 'value');

    await cache.setData(params: params);

    final test = await cache.getData('String');

    expect(test, 'value');
  });

  test('Shared preferences - Set bool value', () async {
    CacheParams params = CacheParams(key: 'bool', value: true);

    await cache.setData(params: params);

    final test = await cache.getData('bool');

    expect(test, true);
  });

  test('Shared preferences - Set List value', () async {
    CacheParams params = CacheParams(key: 'list', value: ['value1', 'value2']);

    await cache.setData(params: params);

    final test = await cache.getData('list');

    expect(test, ['value1', 'value2']);
  });

  test('Shared preferences - Set Map value', () async {
    CacheParams params = CacheParams(key: 'Map', value: {'test': true});

    await cache.setData(params: params);

    final test = await cache.getData('Map');

    expect(test, {'test': true});
  });

  test('Shared preferences - Remove value', () async {
    CacheParams params = CacheParams(key: 'remove', value: 'value');

    await cache.setData(params: params);

    final test = await cache.getData('remove');

    expect(test, 'value');

    await cache.removeData('remove');

    expect(() => cache.getData('remove'), throwsA(isA<CacheException>()));
  });

  test('Shared preferences - Remove all', () async {
    CacheParams params1 = CacheParams(key: 'removeAll1', value: 'value1');
    CacheParams params2 = CacheParams(key: 'removeAll2', value: 'value2');

    await cache.setData(params: params1);
    await cache.setData(params: params2);

    final test1 = await cache.getData('removeAll1');
    expect(test1, 'value1');

    final test2 = await cache.getData('removeAll2');
    expect(test2, 'value2');

    await cache.clearAll();

    expect(() => cache.getData('removeAll1'), throwsA(isA<CacheException>()));
    expect(() => cache.getData('removeAll2'), throwsA(isA<CacheException>()));
  });
}
