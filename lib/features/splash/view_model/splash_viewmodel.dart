import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';

class SplashViewModel extends BaseViewModel {
  final _themeSwitchService = locator<ThemeService>();
  final _log = getLogger('SplashViewModel');

  void actionToggleTheme() {
    _log.i('toggle invoked');
    _themeSwitchService.toggleDarkLightTheme();
  }
}
