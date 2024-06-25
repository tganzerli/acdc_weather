import 'package:acdc_weather_app/core/core.dart';

import '../repositories/weather_repository_interface.dart';

abstract class GetWeatherUsecase {
  Future<Output<ShowWeatherEntity>> call(ShowEntity show);
}

class GetWeatherUsecaseImpl extends GetWeatherUsecase {
  final WeatherForecastRepository weatherForecastRepository;
  GetWeatherUsecaseImpl({
    required this.weatherForecastRepository,
  });

  @override
  Future<Output<ShowWeatherEntity>> call(ShowEntity show) async {
    final weatherResponse =
        await weatherForecastRepository.getShowWeather(show);

    return await weatherResponse.fold(
      (exception) async {
        return await weatherForecastRepository.getShowWeatherInCache(show);
      },
      (weather) async {
        await weatherForecastRepository.saveShowWeatherInCache(weather);
        return right(weather);
      },
    );
  }
}
