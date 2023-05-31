import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_cart.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantDetailScreen({required this.restaurantModel, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: restaurantModel.name,
        child: Column(
          children: [
            RestaurantCard.fromModel(
              restaurantModel: restaurantModel,
              isDetail: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ProductCard(),
            ),
          ],
        ));
  }
}
