import 'package:flutter/material.dart';
import 'package:proj1/Data/dineindatafromat.dart';
import 'dinecard.dart';

class DineListViewBuilder extends StatelessWidget {
  final List<Restaurant> restaurants;

  const DineListViewBuilder({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return DineCard(restaurant: restaurant);
      },
    );
  }
}
