import 'package:acdc_weather_app/core/core.dart';

class WeatherEntity extends Entity {
  final DateTime weatherDate;
  final Weather weather;
  final String weatherDescription;
  final double temperature;
  final double temperatureMax;
  final double temperatureMin;
  final double windSpeed;
  final int windDeg;
  final DateTime sunrise;
  final DateTime sunset;
  final int timezone;
  WeatherEntity(
    super.id, {
    required this.weatherDate,
    required this.weather,
    required this.weatherDescription,
    required this.temperature,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.windSpeed,
    required this.windDeg,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
  });

  @override
  Either<ValidationException, WeatherEntity> validate() {
    if (weatherDescription.isEmpty) {
      return left(const ValidationException(
          message: 'The weather description cannot be empty'));
    }

    return right(this);
  }

  Map<String, dynamic> toMap() {
    return {
      'weatherDate': weatherDate.millisecondsSinceEpoch,
      'weather': weather.toId(),
      'weatherDescription': weatherDescription,
      'temperature': temperature,
      'temperatureMax': temperatureMax,
      'temperatureMin': temperatureMin,
      'windSpeed': windSpeed,
      'windDeg': windDeg,
      'sunrise': sunrise.millisecondsSinceEpoch,
      'sunset': sunset.millisecondsSinceEpoch,
      'timezone': timezone,
    };
  }

  factory WeatherEntity.fromMap(Map<String, dynamic> map) {
    return WeatherEntity('',
        weatherDate: DateTime.fromMillisecondsSinceEpoch(map['weatherDate']),
        weather: Weather.fromId(map['weather']),
        weatherDescription: map['weatherDescription'],
        temperature: map['temperature'].toDouble(),
        temperatureMax: map['temperatureMax'].toDouble(),
        temperatureMin: map['temperatureMin'].toDouble(),
        windSpeed: map['windSpeed'].toDouble(),
        windDeg: map['windDeg'].toInt(),
        sunrise: DateTime.fromMillisecondsSinceEpoch(map['sunrise']),
        sunset: DateTime.fromMillisecondsSinceEpoch(map['sunset']),
        timezone: map['timezone'].toInt());
  }
}
