import 'package:acdc_weather_app/core/core.dart';

abstract class WeatherForecastRepository {
  Future<Output<ShowWeatherEntity>> getShowWeather(ShowEntity show);
  Future<Output<ShowWeatherEntity>> getShowWeatherInCache(ShowEntity show);
  Future<Output<bool>> saveShowWeatherInCache(ShowWeatherEntity weather);
  Future<Output<bool>> deleteShowsWeatherInCache();
}
