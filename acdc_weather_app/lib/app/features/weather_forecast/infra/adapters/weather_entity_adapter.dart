import 'package:acdc_weather_app/core/core.dart';

class WeatherEntityAdapter {
  static WeatherEntity fromCurrentMap(Map map) {
    try {
      Weather weather = switch (map['weather'][0]['id']) {
        (int id) when id >= 200 && id < 300 => Weather.thunderstorm,
        (int id) when id >= 300 && id < 400 => Weather.drizzle,
        (int id) when id >= 500 && id < 600 => Weather.rain,
        (int id) when id >= 600 && id < 700 => Weather.snow,
        (int id) when id > 800 && id < 900 => Weather.clouds,
        (int id) when id >= 300 && id < 400 => Weather.drizzle,
        800 => Weather.clear,
        701 => Weather.mist,
        711 => Weather.smoke,
        721 => Weather.haze,
        731 => Weather.dust,
        741 => Weather.fog,
        751 => Weather.sand,
        762 => Weather.ash,
        771 => Weather.squall,
        781 => Weather.tornado,
        _ => Weather.clear
      };

      return WeatherEntity(
        '',
        weatherDate: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
        weather: weather,
        weatherDescription: map['weather'][0]['description'],
        temperature: map['main']['temp'].toDouble(),
        temperatureMax: map['main']['temp_max'].toDouble(),
        temperatureMin: map['main']['temp_min'].toDouble(),
        windSpeed: map['wind']['speed'].toDouble(),
        windDeg: map['wind']['deg'].toInt(),
        sunrise:
            DateTime.fromMillisecondsSinceEpoch(map['sys']['sunrise'] * 1000),
        sunset:
            DateTime.fromMillisecondsSinceEpoch(map['sys']['sunset'] * 1000),
        timezone: map['timezone'].toInt(),
      );
    } catch (e) {
      throw AdapterException(message: e.toString());
    }
  }

  static List<WeatherEntity> fromForecastMap(Map map) {
    try {
      List<WeatherEntity> weatherList = [];

      DateTime sunrise =
          DateTime.fromMillisecondsSinceEpoch(map['city']['sunrise'] * 1000);
      DateTime sunset =
          DateTime.fromMillisecondsSinceEpoch(map['city']['sunset'] * 1000);
      int timezone = map['city']['timezone'].toInt();

      for (var forecast in map['list']) {
        Weather weather = switch (forecast['weather'][0]['id']) {
          (int id) when id >= 200 && id < 300 => Weather.thunderstorm,
          (int id) when id >= 300 && id < 400 => Weather.drizzle,
          (int id) when id >= 500 && id < 600 => Weather.rain,
          (int id) when id >= 600 && id < 700 => Weather.snow,
          (int id) when id > 800 && id < 900 => Weather.clouds,
          (int id) when id >= 300 && id < 400 => Weather.drizzle,
          800 => Weather.clear,
          701 => Weather.mist,
          711 => Weather.smoke,
          721 => Weather.haze,
          731 => Weather.dust,
          741 => Weather.fog,
          751 => Weather.sand,
          762 => Weather.ash,
          771 => Weather.squall,
          781 => Weather.tornado,
          _ => Weather.clear
        };

        weatherList.add(WeatherEntity(
          '',
          weatherDate:
              DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000),
          weather: weather,
          weatherDescription: forecast['weather'][0]['description'],
          temperature: forecast['main']['temp'].toDouble(),
          temperatureMax: forecast['main']['temp_max'].toDouble(),
          temperatureMin: forecast['main']['temp_min'].toDouble(),
          windSpeed: forecast['wind']['speed'].toDouble(),
          windDeg: forecast['wind']['deg'].toInt(),
          sunrise: sunrise,
          sunset: sunset,
          timezone: timezone,
        ));
      }

      return weatherList;
    } catch (e) {
      throw AdapterException(message: e.toString());
    }
  }
}
