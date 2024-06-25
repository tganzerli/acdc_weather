import 'package:acdc_weather_app/core/core.dart';

abstract class WeatherForecastDataSource {
  Future<RestClientResponse> getCurrentWeather(String city);
  Future<RestClientResponse> getForecastWeather(String city);
}
