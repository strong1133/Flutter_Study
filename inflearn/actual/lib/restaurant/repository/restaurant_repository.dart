import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

@RestApi()
abstract class RestaurnatRepository {
  
  
  @GET("/")
  paginate();

  @GET("/{id}")
  getRestaurantDetail();


}
