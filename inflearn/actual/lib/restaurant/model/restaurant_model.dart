import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

enum RestaurantPriceRange { expensive, medium, cheap }

@JsonSerializable()
class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson( Map<String, dynamic> jsonMap) => _$RestaurantModelFromJson(jsonMap);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this); 

  // factory RestaurantModel.fromJson({required Map<String, dynamic> jsonMap}) {
  //   RestaurantModel restaurantModel = RestaurantModel(
  //       id: jsonMap['id'],
  //       name: jsonMap['name'],
  //       thumbUrl: jsonMap['thumbUrl'],
  //       tags: List<String>.from(jsonMap['tags']),
  //       priceRange: RestaurantPriceRange.values.byName(jsonMap['priceRange']),
  //       ratings: jsonMap['ratings'],
  //       ratingsConunt: jsonMap['ratingsCount'],
  //       deliveryTime: jsonMap['deliveryTime'],
  //       deliveryFee: jsonMap['deliveryFee']);

  //   return restaurantModel;
  // }
}
