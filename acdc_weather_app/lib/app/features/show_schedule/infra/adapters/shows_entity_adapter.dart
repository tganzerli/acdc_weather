import 'package:acdc_weather_app/core/core.dart';

class ShowsEntityAdapter {
  static ShowEntity fromMap(Map map) {
    try {
      return ShowEntity('',
          city: map['city_show'],
          country: map['country_show'],
          date: DateTime.parse(map['date_show']));
    } catch (e) {
      throw AdapterException(message: e.toString());
    }
  }
}
