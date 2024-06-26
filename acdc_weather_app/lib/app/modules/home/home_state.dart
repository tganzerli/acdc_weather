import 'package:acdc_weather_app/core/core.dart';

final class HomeInitial implements InitialState {}

final class HomeLoading implements LoadingState {}

final class HomeError extends ErrorState {
  const HomeError({required super.exception});
}

final class HomeSuccess extends SuccessState<List<ShowWeatherEntity>> {
  const HomeSuccess({required super.data});
}
