import 'package:actual/restaurant/model/restaurant_detial_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurnatRepository {
  factory RestaurnatRepository(Dio dio, {required String baseUrl}) = _RestaurnatRepository;

  @GET("/{id}")
  Future<RestaurantDetailModel> getRestaurantDetail({@Path('id') required String id});
}
