import 'package:actual/product/model/product_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<ProductModel> productList;

  RestaurantDetailModel({
    required this.detail,
    required this.productList,
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
  });

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> jsonMap}) {
    List<ProductModel> productList = [];

    for (Map<String, dynamic> element in jsonMap['products']) {
      ProductModel productModel = ProductModel.fromJson(jsonMap: element);
      productList.add(productModel);
    }

    RestaurantDetailModel restaurantDetailModel = RestaurantDetailModel(
        detail: jsonMap['detail'],
        productList: productList,
        id: jsonMap['id'],
        name: jsonMap['name'],
        thumbUrl: jsonMap['thumbUrl'],
        tags: List<String>.from(jsonMap['tags']),
        priceRange: RestaurantPriceRange.values.byName(jsonMap['priceRange']),
        ratings: jsonMap['ratings'],
        ratingsCount: jsonMap['ratingsCount'],
        deliveryTime: jsonMap['deliveryTime'],
        deliveryFee: jsonMap['deliveryFee']);

    return restaurantDetailModel;
  }
}
