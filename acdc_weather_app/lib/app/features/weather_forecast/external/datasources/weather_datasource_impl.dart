import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/infra/datasources/weather_datasource.dart';

class WeatherForecastDataSourceImpl implements WeatherForecastDataSource {
  final RestClient restClient;

  WeatherForecastDataSourceImpl({required this.restClient});

  final String base = 'https://api.openweathermap.org/data/2.5';
  final String token = 'e867d3e4aa1c5492270723cedfd04107';

  @override
  Future<RestClientResponse> getCurrentWeather(String city) async {
    restClient.setBaseUrl(base);
    try {
      final baseResponse = await restClient.get(RestClientRequest(
          path: '/weather?q=$city&appid=$token&units=metric'));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      throw DefaultException(
          message: e.toString(), stackTracing: StackTrace.current);
    }
  }

  @override
  Future<RestClientResponse> getForecastWeather(String city) async {
    restClient.setBaseUrl(base);
    try {
      final baseResponse = await restClient.get(RestClientRequest(
          path: '/forecast?q=$city&appid=$token&units=metric'));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      throw DefaultException(
          message: e.toString(), stackTracing: StackTrace.current);
    }
  }
}
