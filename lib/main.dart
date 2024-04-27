import 'package:flutter/material.dart';
import 'src/features/features.dart';

import 'src/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;
  // debugInvertOversizedImages = true;

  await EnvironmentService.loadEnvironment();
  // TODO: await Locator.initDependenciesLocator();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFF0A457B),
        ).copyWith(background: const Color(0xFFE8F0F2)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
