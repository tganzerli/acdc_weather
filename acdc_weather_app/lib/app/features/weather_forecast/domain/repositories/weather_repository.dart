import 'package:acdc_weather_app/core/core.dart';

abstract class WeatherForecastRepository {
  Future<Output<ShowWeatherEntity>> getShowWeather(ShowEntity show);
  Future<Output<ShowWeatherEntity>> getShowWeatherInCache(ShowEntity show);
  Future<Output<bool>> saveShowWeatherInCache(List<ShowWeatherEntity> weathers);
  Future<Output<bool>> deleteShowsWeatherInCache();
}
