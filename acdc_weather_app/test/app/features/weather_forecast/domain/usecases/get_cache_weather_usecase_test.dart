import 'package:acdc_weather_app/app/features/weather_forecast/domain/repositories/weather_repository_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/usecases/get_cache_weather_usecase.dart';
import 'package:acdc_weather_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherForecastRepository extends Mock
    implements WeatherForecastRepository {}

void main() {
  late WeatherForecastRepository weatherForecastRepository;
  late GetCacheWeatherUsecase getCacheWeatherUsecase;

  ShowEntity show =
      ShowEntity('', city: 'city', country: 'country', date: DateTime.now());

  ShowWeatherEntity showWeather =
      ShowWeatherEntity('', show: show, forecast: []);

  setUp(
    () {
      weatherForecastRepository = MockWeatherForecastRepository();
      getCacheWeatherUsecase = GetCacheWeatherUsecaseImpl(
          weatherForecastRepository: weatherForecastRepository);

      registerFallbackValue(show);
    },
  );

  test('Get weather from cache', () async {
    when(
      () => weatherForecastRepository.getShowWeatherInCache(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => right(showWeather)));

    final showsResponse = await getCacheWeatherUsecase([show]);

    expect(showsResponse.isRight, true);
  });

  test('No weather forecast in cache', () async {
    when(
      () => weatherForecastRepository.getShowWeatherInCache(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => left(const DefaultException(
          message: 'Error',
        ))));

    final showsResponse = await getCacheWeatherUsecase([show]);

    expect(showsResponse.isRight, false);

    late BaseException exception;
    showsResponse.fold((l) => exception = l, (r) => null);

    expect(exception, isA<DefaultException>());
    expect(exception.message, 'No weather forecast in cache');
  });
}
