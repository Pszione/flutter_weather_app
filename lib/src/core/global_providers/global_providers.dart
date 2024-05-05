import 'package:flutter/material.dart';


class GlobalProviderComponent extends StatelessWidget {
  final Widget child;
  const GlobalProviderComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;

    // return MultiProvider(
    //   providers: [],
    //   child: child,
    // );

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<AuthCubit>.value(value: ServiceLocator.locator()),
    //   ],
    //   child: MultiBlocListener(
    //     listeners: [AuthListener.listener(context)],
    //     child: child,
    //   ),
    // );
  }
}
