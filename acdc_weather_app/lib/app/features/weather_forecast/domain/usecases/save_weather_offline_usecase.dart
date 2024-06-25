import 'package:acdc_weather_app/core/core.dart';

import '../repositories/weather_repository_interface.dart';

abstract class SaveWeatherToOfflineUsecase {
  Future<void> call(List<ShowEntity> shows);
}

class SaveWeatherToOfflineUsecaseImpl extends SaveWeatherToOfflineUsecase {
  final WeatherForecastRepository weatherForecastRepository;
  SaveWeatherToOfflineUsecaseImpl({
    required this.weatherForecastRepository,
  });

  @override
  Future<void> call(List<ShowEntity> shows) async {
    await weatherForecastRepository.deleteShowsWeatherInCache();

    for (var show in shows) {
      final weatherResponse =
          await weatherForecastRepository.getShowWeather(show);
      await weatherResponse.fold(
        (exception) => null, // Could return some log
        (weather) async =>
            await weatherForecastRepository.saveShowWeatherInCache(weather),
      );
    }
  }
}
