import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeModule extends StatelessWidget {
  final Widget child;

  const HomeModule({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MultiCounterStore>(create: (_) => MultiCounterStore()),
        // Provider<Counter>(create: (_) => Counter()),
      ],
      child: child,
    );
  }
}
