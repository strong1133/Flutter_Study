import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/model/restaurant_detial_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double rating;
  final bool isDetail;

  final String? detail;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.tags,
      required this.ratingCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.rating,
      this.isDetail = false,
      this.detail,
      super.key});

  factory RestaurantCard.fromModel({
    required RestaurantModel restaurantModel,
    bool isDetail = false,
  }) {
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
      rating: restaurantModel.ratings,
      isDetail: isDetail,
      detail: restaurantModel is RestaurantDetailModel? restaurantModel.detail :null,
    );
    return restaurantCard;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) ...[image],
        if (!isDetail) ...[
          ClipRRect(
            child: image,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
          child: Column(
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
              ),
                const SizedBox(
                height: 16.0,
              ),
              if (detail != null && isDetail) Text(detail!),
                      const SizedBox(
                height: 16.0,
              ),
            ],
          ),
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
