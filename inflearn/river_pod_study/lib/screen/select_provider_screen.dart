import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/future_provider.dart';
import 'package:river_pod_study/riverpod/select_provider.dart';
import 'package:river_pod_study/riverpod/state_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("BUILD");
    final state = ref.watch(slelectProvider.select((value) => value.isSpicy));

    ref.listen(slelectProvider.select((value) => value.hasBought), (previous, next) {
      log('next: ${next}');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(state.name),
            // Text(state.quantity.toString()),
            // Text(state.hasBought.toString()),
            // Text(state.isSpicy.toString()),
            Text(state.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(slelectProvider.notifier).toggleIsSpicy();
              },
              child: Text('Toggle IsSpicy'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(slelectProvider.notifier).toggleHasBought();
              },
              child: Text('Toggle HasBought'),
            )
          ],
        ),
      ),
    );
  }
}
