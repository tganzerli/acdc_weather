import 'package:acdc_weather_app/core/services/cache/i_cache.dart';
import 'package:acdc_weather_app/core/services/cache/shared_preferences_impl.dart';
import 'package:acdc_weather_app/core/services/client/dio/dio_impl.dart';
import 'package:acdc_weather_app/core/services/client/rest_client.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';

export 'contracts/contracts.dart';
export 'controllers/base_state.dart';
export 'controllers/controllers.dart';
export 'enums/enums.dart';
export 'entites/entity.dart';
export 'errors/errors.dart';
export 'services/cache/cache.dart';
export 'services/client/client.dart';
export 'types/types.dart';

final coreModule = AutoInjector(
  tag: 'coreModule',
  on: (injector) {
    injector.addSingleton<Cache>(SharedPreferencesImpl.new);
    injector.add<Dio>(DioFactory.dio);
    injector.add<RestClient>(RestClientDioImpl.new);
  },
);
