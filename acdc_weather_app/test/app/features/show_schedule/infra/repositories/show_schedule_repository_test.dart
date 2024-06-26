import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/show_schedule/domain/repositories/show_schedule_repository.dart';
import 'package:acdc_weather_app/app/features/show_schedule/infra/datasources/show_schedule_datasource.dart';
import 'package:acdc_weather_app/app/features/show_schedule/infra/repositories/show_schedule_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCache extends Mock implements Cache {}

class MockShowScheduleDataSource extends Mock
    implements ShowScheduleDataSource {}

void main() {
  late Cache cache;
  late ShowScheduleDataSource showScheduleDataSource;
  late ShowScheduleRepository showScheduleRepository;

  final shows = [
    ShowEntity('',
        city: 'Silverstone', country: 'United Kingdom', date: DateTime.now())
  ];

  setUp(
    () {
      cache = MockCache();
      showScheduleDataSource = MockShowScheduleDataSource();
      showScheduleRepository = ShowScheduleRepositoryImpl(
          cache: cache, showScheduleDataSource: showScheduleDataSource);

      registerFallbackValue(CacheParams(
          key: 'showsList',
          value: shows.map((entity) => entity.toMap()).toList()));
    },
  );

  group('getShows function', () {
    test('Get shows from external API', () async {
      when(
        () => showScheduleDataSource.getShows(),
      ).thenAnswer((_) => Future(() => RestClientResponse(
              request: RestClientRequest(path: '/path'),
              statusCode: 200,
              data: [
                {
                  'city_show': 'Silverstone',
                  'country_show': 'United Kingdom',
                  'date_show':
                      DateTime.now().add(const Duration(days: 1)).toString(),
                }
              ])));

      final showsResponse = await showScheduleRepository.getShows();

      expect(showsResponse.isRight, true);
    });

    test('API shows error response', () async {
      when(
        () => showScheduleDataSource.getShows(),
      ).thenThrow(
          const HttpException(message: 'Not authorized', statusCode: 401));

      final showsResponse = await showScheduleRepository.getShows();

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<HttpException>());
    });

    test('API shows with changed JSON', () async {
      when(
        () => showScheduleDataSource.getShows(),
      ).thenAnswer((_) => Future(() => RestClientResponse(
              request: RestClientRequest(path: '/path'),
              statusCode: 200,
              data: [
                {
                  'city': 'Silverstone',
                  'country_show': 'United Kingdom',
                  'date_show':
                      DateTime.now().add(const Duration(days: 1)).toString(),
                }
              ])));

      final showsResponse = await showScheduleRepository.getShows();

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<AdapterException>());
    });

    test('Unmapped exception', () async {
      when(
        () => showScheduleDataSource.getShows(),
      ).thenThrow('exception');

      final showsResponse = await showScheduleRepository.getShows();

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });

  group('getShowsInCache function', () {
    test('Get shows from cache', () async {
      when(
        () => cache.getData('showsList'),
      ).thenAnswer((_) => Future(() => [
            {
              'city': 'Silverstone',
              'country': 'United Kingdom',
              'date': DateTime.now().millisecondsSinceEpoch,
            }
          ]));

      final showsResponse = await showScheduleRepository.getShowsInCache();

      expect(showsResponse.isRight, true);
    });

    test('shows does not exist in cache', () async {
      when(
        () => cache.getData('showsList'),
      ).thenThrow(const CacheException(
        message: 'No value found for key: showsList',
      ));

      final showsResponse = await showScheduleRepository.getShowsInCache();

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<CacheException>());
    });

    test('Unmapped exception', () async {
      when(
        () => cache.getData('showsList'),
      ).thenThrow('exception');

      final showsResponse = await showScheduleRepository.getShowsInCache();

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });

  group('saveShowsInCache function', () {
    test('Save shows from cache', () async {
      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenAnswer((_) => Future(() => true));

      final showsResponse =
          await showScheduleRepository.saveShowsInCache(shows);

      expect(showsResponse.isRight, true);
    });

    test('exception to save in cache', () async {
      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenThrow(const CacheException(
        message: 'Failed to save data for key: showsList',
      ));

      final showsResponse =
          await showScheduleRepository.saveShowsInCache(shows);

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<CacheException>());
    });

    test('Unmapped exception', () async {
      when(
        () => cache.setData(params: any<CacheParams>(named: 'params')),
      ).thenThrow('exception');

      final showsResponse =
          await showScheduleRepository.saveShowsInCache(shows);

      expect(showsResponse.isRight, false);

      late BaseException exception;
      showsResponse.fold(
        (l) => exception = l,
        (r) => null,
      );

      expect(exception, isA<DefaultException>());
    });
  });
}
