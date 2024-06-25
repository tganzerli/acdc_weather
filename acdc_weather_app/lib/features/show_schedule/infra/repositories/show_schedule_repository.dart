import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/features/show_schedule/domain/repositories/show_schedule_repository_interface.dart';
import 'package:acdc_weather_app/features/show_schedule/infra/adapters/shows_entity_adapter.dart';
import 'package:acdc_weather_app/features/show_schedule/infra/datasources/show_schedule_datasource_interface.dart';

class ShowScheduleRepositoryImpl extends ShowScheduleRepository {
  final ICache cache;
  final ShowScheduleDataSource showScheduleDataSource;
  ShowScheduleRepositoryImpl({
    required this.cache,
    required this.showScheduleDataSource,
  });

  @override
  Future<Output<List<ShowEntity>>> getShows() async {
    try {
      final apiShowResponse = await showScheduleDataSource.getShows();

      final showsList = apiShowResponse.data
          .map<ShowEntity>((map) => ShowsEntityAdapter.fromMap(map))
          .toList();

      return right(showsList as List<ShowEntity>);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }

  @override
  Future<Output<List<ShowEntity>>> getShowsInCache() async {
    try {
      final List<Map<String, dynamic>> showsResponse =
          await cache.getData('showsList');

      return right(
          showsResponse.map((map) => ShowEntity.fromMap(map)).toList());
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }

  @override
  Future<Output<bool>> saveShowsInCache(List<ShowEntity> shows) async {
    try {
      CacheParams params = CacheParams(
          key: 'showsList',
          value: shows.map((entity) => entity.toMap()).toList());

      final saveResponse = await cache.setData(params: params);

      return right(saveResponse);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      return left(DefaultException(
          message: e.toString(), stackTracing: StackTrace.current));
    }
  }
}
