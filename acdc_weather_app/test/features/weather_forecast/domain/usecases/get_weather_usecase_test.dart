import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/repositories/weather_repository_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/usecases/get_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherForecastRepository extends Mock
    implements WeatherForecastRepository {}

void main() {
  late WeatherForecastRepository weatherForecastRepository;
  late GetWeatherUsecase getWeatherUsecase;

  ShowEntity show =
      ShowEntity('', city: 'city', country: 'country', date: DateTime.now());

  ShowWeatherEntity showWeather =
      ShowWeatherEntity('', show: show, forecast: []);

  setUp(
    () {
      weatherForecastRepository = MockWeatherForecastRepository();
      getWeatherUsecase = GetWeatherUsecaseImpl(
          weatherForecastRepository: weatherForecastRepository);

      registerFallbackValue(show);
    },
  );

  test('Get weather from external API', () async {
    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => right(showWeather)));

    when(
      () => weatherForecastRepository.saveShowWeatherInCache(showWeather),
    ).thenAnswer((_) => Future(() => right(true)));

    final showsResponse = await getWeatherUsecase(show);

    expect(showsResponse.isRight, true);
  });

  test('Get weather from cache', () async {
    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(
        () => left(const HttpException(message: 'Error', statusCode: 500))));

    when(
      () => weatherForecastRepository.getShowWeatherInCache(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => right(showWeather)));

    final showsResponse = await getWeatherUsecase(show);

    expect(showsResponse.isRight, true);
  });

  test('Error from both methods', () async {
    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(
        () => left(const HttpException(message: 'Error', statusCode: 500))));

    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => left(const DefaultException(
          message: 'Error',
        ))));

    final showsResponse = await getWeatherUsecase(show);

    expect(showsResponse.isRight, false);
  });
}
