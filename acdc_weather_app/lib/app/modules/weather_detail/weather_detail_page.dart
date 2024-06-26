import 'package:acdc_weather_app/app/widget/weather_icon.dart';
import 'package:acdc_weather_app/core/core.dart';
import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeatherDetailPage extends StatefulWidget {
  //final ShowWeatherEntity showWeatherEntity;
  const WeatherDetailPage({
    super.key,
    //required this.showWeatherEntity,
  });

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final arguments =
        (ModalRoute.of(context)?.settings.arguments) as ShowWeatherEntity;
    final text = Theme.of(context).textTheme;
    final colors = BackColors.of(context);

    List<WeatherEntity> forecast = arguments.forecast;
    forecast
        .removeWhere((weather) => weather.weatherDate.isBefore(DateTime.now()));
    forecast.sort((a, b) => a.weatherDate.compareTo(b.weatherDate));
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        backgroundColor: colors.darkBG,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: colors.primary,
          ),
        ),
        title: Text(
          arguments.show.city,
          style: text.displayMedium,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '${forecast.first.temperature.toInt()}˚',
                  style: text.displayLarge,
                ),
                Text(
                  forecast.first.weatherDescription,
                  style: text.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H: ${forecast.first.temperatureMax.toInt()}˚',
                      style: text.headlineSmall,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'L: ${forecast.first.temperatureMin.toInt()}˚',
                      style: text.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  child: ListView.separated(
                    itemCount: forecast.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemBuilder: (context, index) {
                      final weather = forecast[index];
                      return Container(
                        width: 80,
                        height: 160,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weather.weatherDate.hour.toString(),
                              style: text.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '${weather.weatherDate.day}/${weather.weatherDate.month}',
                              style: text.bodyMedium,
                            ),
                            WeatherIcon(
                              weather: weather.weather,
                              height: 60,
                            ),
                            Text(
                              '${weather.temperature.toInt()}˚',
                              style: text.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 22,
                        height: MediaQuery.of(context).size.width / 2 - 22,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            BackImages.wind(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                            ),
                            RotationTransition(
                              turns: AlwaysStoppedAnimation(
                                  forecast.first.windDeg / 360),
                              child: BackImages.arrow(
                                height:
                                    MediaQuery.of(context).size.width / 2 - 40,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  forecast.first.windSpeed.toString(),
                                  style: text.headlineMedium!
                                      .copyWith(fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'm/s',
                                  style: text.bodyLarge,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 22,
                        height: MediaQuery.of(context).size.width / 2 - 22,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_twilight,
                                  color: colors.primary,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'SUNRISE',
                                  style: text.titleMedium!
                                      .copyWith(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Text(
                              '${forecast.first.sunrise.toUtc().add(Duration(seconds: forecast.first.timezone)).hour}:${forecast.first.sunrise.toUtc().add(Duration(seconds: forecast.first.timezone)).minute}',
                              style: text.displayMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sunset:',
                                  style: text.titleMedium,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${forecast.first.sunset.toUtc().add(Duration(seconds: forecast.first.timezone)).hour}:${forecast.first.sunset.toUtc().add(Duration(seconds: forecast.first.timezone)).minute}',
                                  style: text.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
