import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class SignUpModule extends StatelessWidget {
  final Widget child;

  const SignUpModule({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignUpStore>(create: (_) => SignUpStore(locator())),
      ],
      child: child,
    );
  }
}
