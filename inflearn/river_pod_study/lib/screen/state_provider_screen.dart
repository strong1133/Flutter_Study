import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    print(provider.runtimeType);
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('Up'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
              },
              child: Text('Down'),
            ),
          ],
        ),
      ),
    );
  }
}
