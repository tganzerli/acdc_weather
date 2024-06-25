import 'package:acdc_weather_app/core/core.dart';

abstract class ShowScheduleRepository {
  Future<Output<List<ShowEntity>>> getShows();
  Future<Output<List<ShowEntity>>> getShowsInCache();
  Future<Output<bool>> saveShowsInCache(List<ShowEntity> shows);
}
