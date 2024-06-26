import 'package:auto_injector/auto_injector.dart';

import 'app/features/show_schedule/show_schedule.dart';
import 'app/features/weather_forecast/weather_forecast.dart';
import 'app/modules/home/home_controller.dart';
import 'core/core.dart';

final injector = AutoInjector(on: (injector) {
  injector.addInjector(coreModule);
  injector.addInjector(showScheduleModule);
  injector.addInjector(weatherForecastModule);

  injector.addLazySingleton<HomeController>(HomeController.new);

  injector.commit();
});
