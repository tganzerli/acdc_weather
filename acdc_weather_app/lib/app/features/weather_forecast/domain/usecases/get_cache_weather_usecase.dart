import 'package:acdc_weather_app/core/core.dart';

import '../repositories/weather_repository.dart';

abstract class GetCacheWeatherUsecase {
  Future<Output<List<ShowWeatherEntity>>> call(List<ShowEntity> shows);
}

class GetCacheWeatherUsecaseImpl extends GetCacheWeatherUsecase {
  final WeatherForecastRepository weatherForecastRepository;
  GetCacheWeatherUsecaseImpl({
    required this.weatherForecastRepository,
  });

  @override
  Future<Output<List<ShowWeatherEntity>>> call(List<ShowEntity> shows) async {
    List<ShowWeatherEntity> showWeather = [];

    for (var show in shows) {
      final weatherResponse =
          await weatherForecastRepository.getShowWeatherInCache(show);
      weatherResponse.fold(
        (exception) => null, // Could return some log
        (weather) => showWeather.add(weather),
      );
    }

    if (showWeather.isEmpty) {
      return left(
          const DefaultException(message: 'No weather forecast in cache'));
    } else {
      return right(showWeather);
    }
  }
}
