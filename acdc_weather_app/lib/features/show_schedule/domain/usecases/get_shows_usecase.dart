import 'package:acdc_weather_app/core/core.dart';

import '../repositories/show_schedule_repository_interface.dart';

abstract class GetShowsUsecase {
  Future<Output<List<ShowEntity>>> call();
}

class GetShowsUsecaseImpl extends GetShowsUsecase {
  final ShowScheduleRepository showScheduleRepository;
  GetShowsUsecaseImpl({
    required this.showScheduleRepository,
  });

  @override
  Future<Output<List<ShowEntity>>> call() async {
    final showsResponse = await showScheduleRepository.getShows();

    return await showsResponse.fold(
      (exception) async {
        return await showScheduleRepository.getShowsInCache();
      },
      (shows) async {
        await showScheduleRepository.saveShowsInCache(shows);
        return right(shows);
      },
    );
  }
}
