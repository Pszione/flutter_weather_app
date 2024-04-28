import 'package:flutter/material.dart';

import '../../features/features.dart';
import '../../features/home/presenter/dependencies_module.dart';
import '../../features/sign_up/presenter/dependencies_module.dart';
import '../core.dart';

class RouterSystem {
  const RouterSystem._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext globalContext({BuildContext? orElse}) {
    return navigatorKey.currentContext ?? orElse!;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case SplashPage.route:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const SplashPage(),
      //   );

      case '':
      case '/':
      case HomePage.name:
        return MaterialPageRoute(
          settings:
              RouteSettings(name: HomePage.name, arguments: settings.arguments),
          builder: (_) => const HomeModule(child: HomePage()),
        );

      case SignInPage.name:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const SignInModule(child: SignInPage()));
      // case ForgotPasswordPage.route:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const ForgotPasswordPage());
      case SignUpPage.name:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const SignUpModule(child: SignUpPage()));

      ///
      default:
        return MaterialPageRoute(builder: (_) => const ExamplePageScaffold());
    }
  }
}
