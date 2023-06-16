import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/riverpod/future_provider.dart';
import 'package:river_pod_study/riverpod/provider.dart';
import 'package:river_pod_study/riverpod/state_notifier_provider.dart';
import 'package:river_pod_study/riverpod/state_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("ProviderScreen BUILD");
    final state = ref.watch(filteredShoppingList);

    print(state);

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) {
            return FilterState.values.map((e) => PopupMenuItem(value: e, child: Text(e.name))).toList();
          },
          onSelected: (value) {
            log(value.toString());
            ref.read(filterProvider.notifier).update((state) => value);
          },
        )
      ],
      body: ListView(
        children: state.map((e) {
          return CheckboxListTile(
            onChanged: (value) {
              ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
            },
            title: Text(e.name),
            value: e.hasBought,
          );
        }).toList(),
      ),
    );
  }
}
