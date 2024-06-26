import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/repositories/weather_repository_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/infra/datasources/weather_datasource_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/infra/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'moks.dart';

class MockICache extends Mock implements ICache {}

class MpckWeatherForecastDataSource extends Mock
    implements WeatherForecastDataSource {}

void main() {
  final WeatherMocks mock = WeatherMocks();
  late ICache cache;
  late WeatherForecastDataSource weatherForecastDataSource;
  late WeatherForecastRepository weatherForecastRepository;

  final shows = [
    ShowEntity('',
        city: 'Silverstone', country: 'United Kingdom', date: DateTime.now())
  ];

  final showsWeather = [
    ShowWeatherEntity('', show: shows.first, forecast: [
      WeatherEntity('',
          weatherDate: DateTime.now(),
          weather: Weather.clear,
          weatherDescription: 'weatherDescription',
          temperature: 27.6,
          temperatureMax: 29.3,
          temperatureMin: 24.0,
          windSpeed: 3.0,
          windDeg: 90,
          sunrise: DateTime.now(),
          sunset: DateTime.now(),
          timezone: 3000)
    ])
  ];

  setUp(
    () {
      cache = MockICache();
      weatherForecastDataSource = MpckWeatherForecastDataSource();
      weatherForecastRepository = WeatherForecastRepositoryImpl(
          cache: cache, weatherForecastDataSource: weatherForecastDataSource);

      registerFallbackValue(CacheParams(
          key: 'showsForecast',
          value: showsWeather.map((entity) => entity.toMap()).toList()));
    },
  );

  group('getShowWeather function', () {
    test('Get weather from external API', () async {
      when(
        () => weatherForecastDataSource.getCurrentWeather('Silverstone'),
      ).thenAnswer((_) => Future(() => RestClientResponse(
          request: RestClientRequest(path: '/path'),
          statusCode: 200,
          data: mock.current())));

      when(
        () => weatherForecastDataSource.getForecastWeather('Silverstone'),
      ).thenAnswer((_) => Future(() => RestClientResponse(
          request: RestClientRequest(path: '/path'),
          statusCode: 200,
          data: mock.forecast())));

      final weatherResponse =
          await weatherForecastRepository.getShowWeather(shows.first);

      expect(weatherResponse.isRight, true);
    });

    test('API weather error response', () async {
      when(
        () => weatherForecastDataSource.getCurrentWeather('Silverstone'),
      ).thenThrow(
          const HttpException(message: 'Not authorized', statusCode: 401));

      when(
        () => weatherForecastDataSource.getForecastWeather('Silverstone'),
      ).thenAnswer((_) => Future(() => RestClientResponse(
          request: RestClientRequest(path: '/path'),
          statusCode: 200,
          data: mock.forecast())));

      final weatherResponse =
          await weatherForecastRepository.getShowWeather(shows.first);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<HttpException>());
    });

    test('Unmapped exception', () async {
      when(
        () => weatherForecastDataSource.getCurrentWeather('Silverstone'),
      ).thenThrow('exception');
      when(
        () => weatherForecastDataSource.getForecastWeather('Silverstone'),
      ).thenThrow('exception');

      final weatherResponse =
          await weatherForecastRepository.getShowWeather(shows.first);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });

  group('getShowWeatherInCache function', () {
    test('Get weather from cache', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenAnswer((_) => Future(() => [showsWeather.first.toMap()]));

      final weatherResponse =
          await weatherForecastRepository.getShowWeatherInCache(shows.first);

      expect(weatherResponse.isRight, true);
    });

    test('weather does not exist in cache', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenThrow(const CacheException(
        message: 'No value found for key: showsForecast',
      ));

      final weatherResponse =
          await weatherForecastRepository.getShowWeatherInCache(shows.first);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<CacheException>());
    });

    test('Unmapped exception', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenThrow('exception');

      final weatherResponse =
          await weatherForecastRepository.getShowWeatherInCache(shows.first);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });

  group('saveShowWeatherInCache function', () {
    test('Save weather from cache', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenAnswer((_) => Future(() => [showsWeather.first.toMap()]));

      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenAnswer((_) => Future(() => true));

      final weatherResponse =
          await weatherForecastRepository.saveShowWeatherInCache(showsWeather);

      expect(weatherResponse.isRight, true);
    });

    test('exception to save in cache', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenAnswer((_) => Future(() => [showsWeather.first.toMap()]));
      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenThrow(const CacheException(
        message: 'Failed to save data for key: showsForecast',
      ));

      final weatherResponse =
          await weatherForecastRepository.saveShowWeatherInCache(showsWeather);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<CacheException>());
    });

    test('Unmapped exception', () async {
      when(
        () => cache.getData('showsForecast'),
      ).thenAnswer((_) => Future(() => [showsWeather.first.toMap()]));
      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenThrow('exception');

      final weatherResponse =
          await weatherForecastRepository.saveShowWeatherInCache(showsWeather);

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });

  group('deleteShowsWeatherInCache function', () {
    test('Delete weather from cache', () async {
      when(
        () => cache.removeData('showsForecast'),
      ).thenAnswer((_) => Future(() => true));

      final weatherResponse =
          await weatherForecastRepository.deleteShowsWeatherInCache();

      expect(weatherResponse.isRight, true);
    });

    test('exception to delete in cache', () async {
      when(
        () => cache.removeData('showsForecast'),
      ).thenThrow(const CacheException(
        message: 'Failed to delete data for key: showsForecast',
      ));

      final weatherResponse =
          await weatherForecastRepository.deleteShowsWeatherInCache();

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<CacheException>());
    });

    test('Unmapped exception', () async {
      when(
        () => cache.removeData('showsForecast'),
      ).thenThrow('exception');

      final weatherResponse =
          await weatherForecastRepository.deleteShowsWeatherInCache();

      expect(weatherResponse.isRight, false);

      late BaseException exception;
      weatherResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });
}
