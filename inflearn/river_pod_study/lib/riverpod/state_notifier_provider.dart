import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/model/shopping_item_model.dart';

final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(name: '라면', quantity: 5, hasBought: false, isSpicy: true),
            ShoppingItemModel(name: '치킨', quantity: 2, hasBought: true, isSpicy: false),
            ShoppingItemModel(name: '과자', quantity: 1, hasBought: false, isSpicy: false),
            ShoppingItemModel(name: '피자', quantity: 3, hasBought: false, isSpicy: false),
            ShoppingItemModel(name: '짜장면', quantity: 1, hasBought: true, isSpicy: false),
          ],
        );

  void toggleHasBought({required String name}) {
    state = state.map((e) => e.name == name ? ShoppingItemModel(name: e.name, quantity: e.quantity, hasBought: !e.hasBought, isSpicy: e.isSpicy) : e).toList();
  } 
}
