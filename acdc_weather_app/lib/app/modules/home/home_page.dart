import 'package:acdc_weather_app/app/widget/weather_icon_widget.dart';
import 'package:acdc_weather_app/core/core.dart';
import 'package:acdc_weather_app/injector.dart';
import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = injector.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.initEvent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final text = Theme.of(context).textTheme;
    final colors = BackColors.of(context);
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colors.darkBG,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, state, __) {
              return switch (state) {
                HomeLoading() => Center(
                    child: CircularProgressIndicator(color: colors.primary)),
                HomeError() => Center(
                    child: Text(
                      state.exception.message,
                      style: text.titleLarge,
                    ),
                  ),
                HomeSuccess() => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.maxFinite,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.primary),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: colors.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: LineTextField(
                                  status: TextFieldStatus.enabled,
                                  hintText: 'Tour city',
                                  controller: controller.cityController,
                                  onChanged: (text) =>
                                      controller.searchCityEvent(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const BackLogos.logoText(
                        height: 180,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Schedule',
                            style: text.headlineMedium,
                          ),
                        ),
                      ),
                      Flexible(child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                child: Column(
                                  children:
                                      List.generate(state.data.length, (index) {
                                    final show = state.data[index].show;
                                    List<WeatherEntity> forecast =
                                        state.data[index].forecast;
                                    forecast.removeWhere((weather) => weather
                                        .weatherDate
                                        .isBefore(DateTime.now()));
                                    forecast.sort((a, b) =>
                                        a.weatherDate.compareTo(b.weatherDate));
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                            context, '/weatherDetai',
                                            arguments: state.data[index]),
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${show.date.day}/${show.date.month}',
                                                        style: text.titleMedium,
                                                      ),
                                                      Text(
                                                        show.city,
                                                        style: text.titleLarge,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        WeatherIcon(
                                                          weather: forecast
                                                              .first.weather,
                                                          height: 30,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '${forecast.first.temperature.toInt()}˚',
                                                          style:
                                                              text.titleLarge,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: double.maxFinite,
                                                height: 1,
                                                color: colors.primary
                                                    .withOpacity(0.3),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                _ => const SizedBox()
              };
            },
          ),
        ),
      ),
    );
  }
}
