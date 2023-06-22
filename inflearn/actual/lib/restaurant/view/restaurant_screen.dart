import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/provider/restaurant_provider.dart';
import 'package:actual/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);

    final resp = await dio.get(
      "http://$ip/restaurant",
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if (data is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final cp  = data as CursorPaginationModel;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: cp.data.length ,
        itemBuilder: (_, index) {
          final item = cp.data[index];
          RestaurantModel restaurantModel = item;
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                      restaurantModel: restaurantModel,
                    ),
                  ),
                );
              },
              child: RestaurantCard.fromModel(restaurantModel: restaurantModel));
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
      ),
    );
  }
}
