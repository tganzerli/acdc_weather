import 'package:acdc_weather_app/app/features/show_schedule/domain/usecases/get_shows_usecase.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/usecases/get_cache_weather_usecase.dart';
import 'package:acdc_weather_app/app/features/weather_forecast/domain/usecases/get_external_weather_usecase.dart';
import 'package:acdc_weather_app/core/core.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomeController extends BaseController<BaseState> {
  final GetShowsUsecase getShowsUsecase;
  final GetCacheWeatherUsecase getCacheWeatherUsecase;
  final GetExternalWeatherUsecase getExternalWeatherUsecase;

  HomeController({
    required this.getShowsUsecase,
    required this.getCacheWeatherUsecase,
    required this.getExternalWeatherUsecase,
  }) : super(HomeInitial());

  late final cityController = TextEditingController();

  List<ShowWeatherEntity> _weathersStatus = [];

  Future<void> initEvent() async {
    update(HomeLoading());

    final showsResponse = await getShowsUsecase();

    showsResponse.fold(
      (exception) {
        update(HomeError(exception: exception));
      },
      (shows) async {
        update(HomeSuccess(
            data: shows
                .map((show) => ShowWeatherEntity('', show: show, forecast: []))
                .toList()));

        final cacheWeather = await getCacheWeatherUsecase(shows);
        cacheWeather.fold(
          (exceptionCache) {
            update(const HomeSuccess(data: []));
          },
          (weathers) {
            List<ShowWeatherEntity> weathersSort = weathers;
            _weathersStatus = weathers;
            weathersSort.sort((a, b) => a.show.date.compareTo(b.show.date));
            update(HomeSuccess(data: weathersSort));
          },
        );
        final externalWeather = await getExternalWeatherUsecase(shows);
        externalWeather.fold(
          (exceptionExternal) => null,
          (weathers) {
            List<ShowWeatherEntity> weathersSort = weathers;
            _weathersStatus = weathers;
            weathersSort.sort((a, b) => a.show.date.compareTo(b.show.date));
            update(HomeSuccess(data: weathersSort));
          },
        );
      },
    );
  }

  Future<void> searchCityEvent() async {
    final searchText = cityController.text.toLowerCase().removeAccents();
    if (searchText.isEmpty) {
      update(HomeSuccess(data: _weathersStatus));
    } else {
      List<ShowWeatherEntity> searchCity = _weathersStatus
          .where((showWeather) => showWeather.show.city
              .toLowerCase()
              .removeAccents()
              .contains(searchText))
          .toList();
      update(HomeSuccess(data: searchCity));
    }
  }
}
