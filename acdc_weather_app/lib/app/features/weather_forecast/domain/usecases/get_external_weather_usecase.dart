import 'package:acdc_weather_app/core/core.dart';

import '../repositories/weather_repository.dart';

abstract class GetExternalWeatherUsecase {
  Future<Output<List<ShowWeatherEntity>>> call(List<ShowEntity> shows);
}

class GetExternalWeatherUsecaseImpl extends GetExternalWeatherUsecase {
  final WeatherForecastRepository weatherForecastRepository;
  GetExternalWeatherUsecaseImpl({
    required this.weatherForecastRepository,
  });

  @override
  Future<Output<List<ShowWeatherEntity>>> call(List<ShowEntity> shows) async {
    List<ShowWeatherEntity> showWeather = [];

    for (var show in shows) {
      final weatherResponse =
          await weatherForecastRepository.getShowWeather(show);
      weatherResponse.fold(
        (exception) => null, // Could return some log
        (weather) => showWeather.add(weather),
      );
    }

    if (showWeather.isEmpty) {
      return left(const DefaultException(
          message: 'Unable to get weather forecast from API'));
    } else {
      await weatherForecastRepository.deleteShowsWeatherInCache();
      await weatherForecastRepository.saveShowWeatherInCache(showWeather);
      return right(showWeather);
    }
  }
}
