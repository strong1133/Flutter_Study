import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_cart.dart';
import 'package:actual/product/model/product_model.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_detial_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/repository/restaurant_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantDetailScreen({required this.restaurantModel, super.key});

  Future<RestaurantDetailModel> getRestaurantDetail() async {
    final dio = Dio(); 

    dio.interceptors.add(
      CustomInterceptor(storage: storage),
    );


    RestaurantDetailModel resp = await RestaurnatRepository(dio, baseUrl: "http://$ip/restaurant").getRestaurantDetail(id: restaurantModel.id);

    // final resp = await dio.get(
    //   "http://$ip/restaurant/${restaurantModel.id}",
    //   options: Options(
    //     headers: {
    //       "authorization": "Bearer $accessToken",
    //     },
    //   ),
    // );

    return resp;
  }
 
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: restaurantModel.name,
        child: FutureBuilder<RestaurantDetailModel>(
          future: getRestaurantDetail(),
          builder: (context, AsyncSnapshot<RestaurantDetailModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            RestaurantDetailModel restaurantDetailModel = snapshot.data!;

            return CustomScrollView(
              slivers: [
                renderTop(restaurantDetailModel: restaurantDetailModel),
                renderLabel(),
                renderProduct(productList: restaurantDetailModel.productList),
              ],
            );
          },
        ));
  }

  SliverToBoxAdapter renderTop({required RestaurantDetailModel restaurantDetailModel}) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          RestaurantCard.fromModel(
            restaurantModel: restaurantDetailModel,
            isDetail: true,
          ),
        ],
      ),
    );
  }

  SliverPadding renderProduct({required List<ProductModel> productList }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromModel(productModel: productList[index]),
            );
          },
          childCount: productList.length,
        ),
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
