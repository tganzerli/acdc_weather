import 'package:acdc_weather_app/core/core.dart';
import 'package:auto_injector/auto_injector.dart';

import 'domain/repositories/weather_repository_interface.dart';
import 'domain/usecases/get_weather_usecase.dart';
import 'domain/usecases/save_weather_offline_usecase.dart';
import 'external/datasources/weather_datasource_interface_impl.dart';
import 'infra/datasources/weather_datasource_interface.dart';
import 'infra/repositories/weather_repository.dart';

final weatherForecastModule = AutoInjector(
  tag: 'weatherForecast',
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<WeatherForecastDataSource>(WeatherForecastDataSourceImpl.new);
    injector.add<WeatherForecastRepository>(WeatherForecastRepositoryImpl.new);
    injector.add<GetWeatherUsecase>(GetWeatherUsecaseImpl.new);
    injector
        .add<SaveWeatherToOfflineUsecase>(SaveWeatherToOfflineUsecaseImpl.new);
  },
);
