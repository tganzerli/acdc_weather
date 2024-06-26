import 'package:acdc_weather_app/core/core.dart';
import 'package:auto_injector/auto_injector.dart';

import 'domain/repositories/show_schedule_repository.dart';
import 'domain/usecases/get_shows_usecase.dart';
import 'external/datasources/show_schedule_datasource_impl.dart';
import 'infra/datasources/show_schedule_datasource.dart';
import 'infra/repositories/show_schedule_repository_impl.dart';

final showScheduleModule = AutoInjector(
  tag: 'showSchedule',
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<ShowScheduleDataSource>(ShowScheduleDataSourceImpl.new);
    injector.add<ShowScheduleRepository>(ShowScheduleRepositoryImpl.new);
    injector.add<GetShowsUsecase>(GetShowsUsecaseImpl.new);
  },
);
