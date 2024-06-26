import 'package:acdc_weather_app/app/features/weather_forecast/domain/repositories/weather_repository_interface.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/usecases/get_external_weather_usecase.dart';
import 'package:acdc_weather_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherForecastRepository extends Mock
    implements WeatherForecastRepository {}

void main() {
  late WeatherForecastRepository weatherForecastRepository;
  late GetExternalWeatherUsecase getExternalWeatherUsecase;

  ShowEntity show =
      ShowEntity('', city: 'city', country: 'country', date: DateTime.now());

  ShowWeatherEntity showWeather =
      ShowWeatherEntity('', show: show, forecast: []);

  setUp(
    () {
      weatherForecastRepository = MockWeatherForecastRepository();
      getExternalWeatherUsecase = GetExternalWeatherUsecaseImpl(
          weatherForecastRepository: weatherForecastRepository);

      registerFallbackValue(show);
      registerFallbackValue([showWeather]);
    },
  );

  test('Get weather from external API', () async {
    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => right(showWeather)));

    when(
      () => weatherForecastRepository.deleteShowsWeatherInCache(),
    ).thenAnswer((_) => Future(() => right(true)));

    when(
      () => weatherForecastRepository
          .saveShowWeatherInCache(any<List<ShowWeatherEntity>>()),
    ).thenAnswer((_) => Future(() => right(true)));

    final showsResponse = await getExternalWeatherUsecase([show]);

    expect(showsResponse.isRight, true);
  });

  test('No weather forecast in cache', () async {
    when(
      () => weatherForecastRepository.getShowWeather(any<ShowEntity>()),
    ).thenAnswer((_) => Future(() => left(const DefaultException(
          message: 'Error',
        ))));

    final showsResponse = await getExternalWeatherUsecase([show]);

    expect(showsResponse.isRight, false);

    late BaseException exception;
    showsResponse.fold((l) => exception = l, (r) => null);

    expect(exception, isA<DefaultException>());
    expect(exception.message, 'Unable to get weather forecast from API');
  });
}
