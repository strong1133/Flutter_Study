import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/future_provider.dart';
import 'package:river_pod_study/riverpod/state_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.when(data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            }, error: (e, stack) {
              return Text(e.toString());
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
