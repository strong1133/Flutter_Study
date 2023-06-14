import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/layout/default_layout.dart';
import 'package:river_pod_study/model/shopping_item_model.dart';
import 'package:river_pod_study/riverpod/state_notifier_provider.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("BUILD");
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);
    return DefaultLayout(
        title: 'StateNotifierProvider',
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
        ));
  }
}
