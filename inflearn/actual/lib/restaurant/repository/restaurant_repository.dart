import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurnatRepository {

  factory RestaurnatRepository({required Dio dio, required String baseUrl}) = _RestaurnatRepository;
  
  
  @GET("/")
  paginate();

  @GET("/{id}")
  getRestaurantDetail();

 
}
