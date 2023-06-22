import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider = StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final respository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: respository);
  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({required this.repository}) : super(CursorPaginationLoading()) {
    pagenate();
  }

  pagenate() async {
    final resp = await repository.paginate();
    state = resp;
  }
}
