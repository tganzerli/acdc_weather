import 'package:acdc_weather_app/core/core.dart';
import 'package:auto_injector/auto_injector.dart';

import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_cache_weather_usecase.dart';
import 'domain/usecases/get_external_weather_usecase.dart';
import 'external/datasources/weather_datasource_impl.dart';
import 'infra/datasources/weather_datasource.dart';
import 'infra/repositories/weather_repository_impl.dart';

final weatherForecastModule = AutoInjector(
  tag: 'weatherForecast',
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<WeatherForecastDataSource>(WeatherForecastDataSourceImpl.new);
    injector.add<WeatherForecastRepository>(WeatherForecastRepositoryImpl.new);
    injector.add<GetCacheWeatherUsecase>(GetCacheWeatherUsecaseImpl.new);
    injector.add<GetExternalWeatherUsecase>(GetExternalWeatherUsecaseImpl.new);
  },
);
