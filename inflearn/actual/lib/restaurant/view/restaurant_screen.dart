import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      "http://$ip/restaurant",
      options: Options(
        headers: {
          "authorization": "Bearer $accessToken",
        },
      ),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List>(
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                print(snapshot.data);
                print(snapshot.error);

                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final item = snapshot.data![index];
                    RestaurantModel pItem = RestaurantModel.fromJson(jsonMap: item);

                    return RestaurantCard(
                        image: Image.network(
                          'http://$ip${pItem.thumbUrl}',
                          fit: BoxFit.cover,
                        ),
                        name: pItem.name,
                        tags:pItem.tags,
                        
                        ratingCount: pItem.ratingsConunt,
                        deliveryTime: pItem.deliveryTime,
                        deliveryFee: pItem.deliveryFee,
                        rating: pItem.ratings );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 16.0,
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
