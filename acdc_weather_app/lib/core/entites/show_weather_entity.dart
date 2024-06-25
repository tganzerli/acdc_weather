import 'package:acdc_weather_app/core/core.dart';

class ShowWeatherEntity extends Entity {
  final ShowEntity show;
  final List<WeatherEntity> forecast;
  ShowWeatherEntity(
    super.id, {
    required this.show,
    required this.forecast,
  });

  @override
  Either<ValidationException, ShowWeatherEntity> validate() {
    if (show.validate().isLeft) {
      return show.validate().map((r) => this);
    }
    for (var weather in forecast) {
      if (weather.validate().isLeft) {
        return weather.validate().map((r) => this);
      }
    }

    return right(this);
  }

  Map<String, dynamic> toMap() {
    return {
      'show': show.toMap(),
      'forecast': forecast.map((x) => x.toMap()).toList(),
    };
  }

  factory ShowWeatherEntity.fromMap(Map<String, dynamic> map) {
    return ShowWeatherEntity(
      '',
      show: ShowEntity.fromMap(map['show']),
      forecast: List<WeatherEntity>.from(
          map['forecast']?.map((x) => WeatherEntity.fromMap(x))),
    );
  }
}
