import 'package:flutter/material.dart';

class ExamplePageScaffold extends StatelessWidget {
  final Function()? onPressedFab;

  const ExamplePageScaffold({super.key, this.onPressedFab});

  @override
  Widget build(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    final title = routeSettings?.name ?? 'Example Page';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: onPressedFab != null
          ? FloatingActionButton(
              onPressed: onPressedFab,
              child: const Icon(Icons.arrow_circle_right_rounded),
            )
          : null,
    );
  }
}
