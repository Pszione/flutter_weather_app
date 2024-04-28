import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';
import 'controllers/sign_in_store.dart';

class SignInModule extends StatelessWidget {
  final Widget child;

  const SignInModule({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInStore>(create: (_) => SignInStore(locator())),
      ],
      child: child,
    );
  }
}
