import 'package:acdc_weather_app/core/services/cache/i_cache.dart';
import 'package:acdc_weather_app/core/services/cache/shared_preferences_impl.dart';
import 'package:auto_injector/auto_injector.dart';

export 'contracts/contracts.dart';
export 'errors/errors.dart';
export 'services/cache/cache.dart';
export 'types/types.dart';

final coreModule = AutoInjector(
  on: (injector) {
    injector.addSingleton<ICache>(SharedPreferencesImpl.new);
  },
);
