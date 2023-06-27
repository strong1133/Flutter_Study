import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/model/pagination_params.dart';
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

  pagenate({int fetchCount = 20, bool fetchMore = false, bool forceReFetch = false}) async {
    // final resp = await repository.paginate();
    // state = resp;

    if (state is CursorPaginationModel && !forceReFetch) {
      final pState = state as CursorPaginationModel;

      if (!pState.meta.hasMore) {
        return;
      }
    }

    final isLoading = state is CursorPaginationLoading;
    final isReFetching = state is CursorPaginationRefetching;
    final isFetchingMore = state is CursorPaginationFetchingMore;

    if (fetchMore && (isLoading || isReFetching || isFetchingMore)) {
      return;
    }

    PaginationParams paginationParams = PaginationParams(count: fetchCount);

    if (fetchMore) {
      final pState = state as CursorPaginationModel;

      state = CursorPaginationFetchingMore(meta: pState.meta, data: pState.data);

      paginationParams = paginationParams.copyWith(after: pState.data.last.id);
    }

    final resp = await repository.paginate(paginationParams: paginationParams);
    state = resp;
  }
}
