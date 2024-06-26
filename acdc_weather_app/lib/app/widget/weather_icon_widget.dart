import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/widgets.dart';

import 'package:acdc_weather_app/core/core.dart';

class WeatherIcon extends StatelessWidget {
  final Weather weather;
  final double? height;
  final double? width;
  const WeatherIcon(
      {super.key, required this.weather, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return switch (weather) {
      Weather.clear => BackIcons.weatherClear(
          height: height,
          width: width,
        ),
      Weather.clouds => BackIcons.weatherClouds(
          height: height,
          width: width,
        ),
      Weather.drizzle => BackIcons.weatherDrizzle(
          height: height,
          width: width,
        ),
      Weather.mist => BackIcons.weatherMist(
          height: height,
          width: width,
        ),
      Weather.rain => BackIcons.weatherRein(
          height: height,
          width: width,
        ),
      Weather.snow => BackIcons.weatherSnow(
          height: height,
          width: width,
        ),
      Weather.thunderstorm => BackIcons.weatherThunderstorm(
          height: height,
          width: width,
        ),
      _ => BackIcons.weatherMist(
          height: height,
          width: width,
        )
    };
  }
}
