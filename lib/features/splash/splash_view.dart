import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../generated/l10n.dart';
import 'view_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.current.splash_view,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: model.actionToggleTheme,
                  child: Text(
                    S.current.toggle,
                    style: theme.textTheme.button,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
