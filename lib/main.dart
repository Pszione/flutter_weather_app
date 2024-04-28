import 'package:flutter/material.dart';
import 'src/features/features.dart';

import 'src/core/core.dart';
import 'src/features/home/presenter/dependencies_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;
  // debugInvertOversizedImages = true;

  await EnvironmentService.loadEnvironment();
  await DependenciesLocator.initLocator();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DependenciesLocator.appName,
      //
      navigatorKey: RouterSystem.navigatorKey,
      scaffoldMessengerKey: RouterSystem.scaffoldMessengerKey,
      builder: (context, child) => GlobalProviderComponent(
        child: child ?? const ExamplePageScaffold(),
      ),
      initialRoute: '/',
      onGenerateRoute: RouterSystem.onGenerateRoute,
      //
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFF0A457B),
        ).copyWith(background: const Color(0xFFE8F0F2)),
        useMaterial3: true,
      ),
    );
  }
}
