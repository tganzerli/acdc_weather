import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'modules/weather_detail/weather_detail_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/weatherDetai': (context) => const WeatherDetailPage(),
      },
    );
  }
}
