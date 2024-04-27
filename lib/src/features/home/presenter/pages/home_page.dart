import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final store = Provider.of<MultiCounterStore>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar.medium(
            title: const PageTitleText(title: 'Home Page'),
            scrolledUnderElevation: 10,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 86),
              title: const SafeArea(
                  child:
                      PageTitleText(title: 'Home Page', color: Colors.white)),
              background: Image.asset(
                AppAssetsEnum.blueSkyImage.path,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                errorBuilder: (context, _, __) => const SizedBox(),
              ),
            ),
          ),
          Observer(
            builder: (_) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => CounterCard(
                  index: index,
                  counter: store.counters[index],
                  onIncrementCounter: store.counters[index].increment,
                ),
                childCount: store.counters.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Gap(60)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.addCounter,
        tooltip: 'Add new counter',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PageTitleText extends StatelessWidget {
  final String title;
  final Color? color;

  const PageTitleText({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: color, fontWeight: FontWeight.bold),
    );
  }
}

class CounterCard extends StatelessWidget {
  final int index;
  final SingleCounter counter;
  final Function() onIncrementCounter;

  const CounterCard({
    super.key,
    required this.index,
    required this.counter,
    required this.onIncrementCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(60),
        ListTile(
          title: Text(
            'You have pushed this counter this many times:',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(20),
        Observer(builder: (context) {
          return Center(
            child: Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
        }),
        const Gap(20),
        Center(
          child: ElevatedButton(
            onPressed: onIncrementCounter,
            child: const Text('Increment Counter'),
          ),
        ),
      ],
    );
  }
}
