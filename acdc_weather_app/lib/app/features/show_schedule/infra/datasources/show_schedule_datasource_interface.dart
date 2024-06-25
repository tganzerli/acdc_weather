import 'package:acdc_weather_app/core/core.dart';

abstract class ShowScheduleDataSource {
  Future<RestClientResponse> getShows();
}
