import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/repositories/weather_repository_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/infra/adapters/weather_entity_adapter.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/infra/datasources/weather_datasource_interface.dart';

class WeatherForecastRepositoryImpl extends WeatherForecastRepository {
  final ICache cache;
  final WeatherForecastDataSource weatherForecastDataSource;
  WeatherForecastRepositoryImpl({
    required this.cache,
    required this.weatherForecastDataSource,
  });

  @override
  Future<Output<ShowWeatherEntity>> getShowWeather(ShowEntity show) async {
    try {
      final currentResponse = await weatherForecastDataSource
          .getCurrentWeather(show.city.removeAccents());
      final forecastResponse = await weatherForecastDataSource
          .getForecastWeather(show.city.removeAccents());

      List<WeatherEntity> forecast = [];

      forecast.add(WeatherEntityAdapter.fromCurrentMap(currentResponse.data));
      forecast
          .addAll(WeatherEntityAdapter.fromForecastMap(forecastResponse.data));

      return right(ShowWeatherEntity('', show: show, forecast: forecast));
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }

  @override
  Future<Output<ShowWeatherEntity>> getShowWeatherInCache(
      ShowEntity show) async {
    try {
      final List<Map<String, dynamic>> forecastResponse =
          await cache.getData('showsForecast');

      List<ShowWeatherEntity> showsForecast = forecastResponse
          .map((map) => ShowWeatherEntity.fromMap(map))
          .toList();

      return right(showsForecast
          .where((forecast) => forecast.show.city == show.city)
          .first);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }

  @override
  Future<Output<bool>> saveShowWeatherInCache(
      List<ShowWeatherEntity> weathers) async {
    try {
      CacheParams params = CacheParams(
          key: 'showsForecast',
          value: weathers.map((forecast) => forecast.toMap()).toList());

      final saveResponse = await cache.setData(params: params);

      return right(saveResponse);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }

  @override
  Future<Output<bool>> deleteShowsWeatherInCache() async {
    try {
      final bool deleteResponse = await cache.removeData('showsForecast');

      return right(deleteResponse);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }
}
