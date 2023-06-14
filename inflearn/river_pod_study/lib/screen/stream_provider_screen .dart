import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/future_provider.dart';
import 'package:river_pod_study/riverpod/state_provider.dart';
import 'package:river_pod_study/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue state = ref.watch(multipleStreamProvider);
    log("BUILD");
    return DefaultLayout(
      title: 'StreamProviderScreen',
      body: Center(
        child: state.when(data: (data) {
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
      ),
    );
  }
}
