import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/features/show_schedule/domain/repositories/show_schedule_repository_interface.dart';
import 'package:acdc_weather_app/features/show_schedule/domain/usecases/get_shows_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockShowScheduleRepository extends Mock
    implements ShowScheduleRepository {}

void main() {
  late ShowScheduleRepository showScheduleRepository;
  late GetShowsUsecase getShowsUsecase;

  final List<ShowEntity> showsList = [
    ShowEntity('', city: 'city', country: 'country', date: DateTime.now()),
  ];

  setUp(
    () {
      showScheduleRepository = MockShowScheduleRepository();
      getShowsUsecase =
          GetShowsUsecaseImpl(showScheduleRepository: showScheduleRepository);
    },
  );

  test('Get shows from external API', () async {
    when(
      () => showScheduleRepository.getShows(),
    ).thenAnswer((_) => Future(() => right(showsList)));

    when(
      () => showScheduleRepository.saveShowsInCache(showsList),
    ).thenAnswer((_) => Future(() => right(true)));

    final showsResponse = await getShowsUsecase();

    expect(showsResponse.isRight, true);
  });

  test('Get shows from cache', () async {
    when(
      () => showScheduleRepository.getShows(),
    ).thenAnswer((_) => Future(
        () => left(const HttpException(message: 'Error', statusCode: 500))));

    when(
      () => showScheduleRepository.getShowsInCache(),
    ).thenAnswer((_) => Future(() => right(showsList)));

    final showsResponse = await getShowsUsecase();

    expect(showsResponse.isRight, true);
  });

  test('Error from both methods', () async {
    when(
      () => showScheduleRepository.getShows(),
    ).thenAnswer((_) => Future(
        () => left(const HttpException(message: 'Error', statusCode: 500))));

    when(
      () => showScheduleRepository.getShowsInCache(),
    ).thenAnswer((_) => Future(() => left(const DefaultException(
          message: 'Error',
        ))));

    final showsResponse = await getShowsUsecase();

    expect(showsResponse.isRight, false);
  });
}
