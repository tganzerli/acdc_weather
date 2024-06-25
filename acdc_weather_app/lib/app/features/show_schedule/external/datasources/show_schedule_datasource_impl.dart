import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/app/features/show_schedule/infra/datasources/show_schedule_datasource_interface.dart';

class ShowScheduleDataSourceImpl implements ShowScheduleDataSource {
  @override
  Future<RestClientResponse> getShows() async {
    return RestClientResponse(
        request: RestClientRequest(path: '/path'),
        statusCode: 200,
        data: [
          {
            'city_show': 'Silverstone',
            'country_show': 'United Kingdom',
            'date_show': DateTime.now().add(const Duration(days: 1)).toString(),
          },
          {
            'city_show': 'São Paulo',
            'country_show': 'Brazil',
            'date_show': DateTime.now().add(const Duration(days: 2)).toString(),
          },
          {
            'city_show': 'Melbourne',
            'country_show': 'Australia',
            'date_show': DateTime.now().add(const Duration(days: 3)).toString(),
          },
          {
            'city_show': 'Monte Carlo',
            'country_show': 'Monaco',
            'date_show': DateTime.now().add(const Duration(days: 4)).toString(),
          }
        ]);
  }
}
