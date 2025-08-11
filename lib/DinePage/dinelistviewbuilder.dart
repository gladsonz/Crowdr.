import 'package:flutter/material.dart';
import 'package:proj1/Data/dineindatafromat.dart';
import 'dinecard.dart';

class DineListViewBuilder extends StatelessWidget {
  final List<Restaurant> restaurants;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const DineListViewBuilder({
    super.key,
    required this.restaurants,
    this.shrinkWrap,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap ?? false,
      physics: physics,
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return DineCard(restaurant: restaurant);
      },
    );
  }
}
