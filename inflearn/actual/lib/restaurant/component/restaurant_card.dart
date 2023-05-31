import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double rating;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.tags,
      required this.ratingCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.rating,
      super.key});

  factory RestaurantCard.fromModel({required RestaurantModel restaurantModel}) {
    Image thumbImage = Image.network(
      'http://$ip${restaurantModel.thumbUrl}',
      fit: BoxFit.cover,
    );
    RestaurantCard restaurantCard = RestaurantCard(
        image: thumbImage,
        name: restaurantModel.name,
        tags: restaurantModel.tags,
        ratingCount: restaurantModel.ratingsConunt,
        deliveryTime: restaurantModel.deliveryTime,
        deliveryFee: restaurantModel.deliveryFee,
        rating: restaurantModel.ratings);
    return restaurantCard;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: image,
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              tags.join(' · '),
              style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                _IconText(icon: Icons.star, label: rating.toString()),
                renderDot(),
                _IconText(icon: Icons.receipt, label: ratingCount.toString()),
                renderDot(),
                _IconText(icon: Icons.timelapse_outlined, label: '$deliveryTime 분 '),
                renderDot(),
                _IconText(icon: Icons.monetization_on, label: deliveryFee == 0 ? '무료' : deliveryFee.toString()),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
