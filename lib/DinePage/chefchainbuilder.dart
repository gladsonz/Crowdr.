import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/chefchainsformat.dart';

// A single card widget for a chef.
class ChefCard extends StatelessWidget {
  final Chef chef;

  const ChefCard({super.key, required this.chef});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(chef.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            chef.name,
            style: GoogleFonts.leagueSpartan(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            chef.specialty,
            style: GoogleFonts.leagueSpartan(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// A widget to build a horizontal list of chef cards.
class ChefListViewBuilder extends StatelessWidget {
  final List<Chef> chefs;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const ChefListViewBuilder({
    super.key,
    required this.chefs,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: Axis.horizontal,
      itemCount: chefs.length,
      itemBuilder: (context, index) {
        return ChefCard(chef: chefs[index]);
      },
    );
  }
}

// A single card widget for a food chain.
class FoodChainCard extends StatelessWidget {
  final FoodChain foodChain;

  const FoodChainCard({super.key, required this.foodChain});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(foodChain.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            foodChain.name,
            style: GoogleFonts.leagueSpartan(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// A single card widget for a food chain grid item.
class FoodChainGridItem extends StatelessWidget {
  final FoodChain foodChain;

  const FoodChainGridItem({super.key, required this.foodChain});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(foodChain.imageUrl),
            ),
            const SizedBox(height: 8),
            Text(
              foodChain.name,
              style: GoogleFonts.leagueSpartan(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// A widget to build a grid of food chain cards.
class FoodChainGridViewBuilder extends StatelessWidget {
  final List<FoodChain> foodChains;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const FoodChainGridViewBuilder({
    super.key,
    required this.foodChains,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: foodChains.length,
      itemBuilder: (context, index) {
        return FoodChainGridItem(foodChain: foodChains[index]);
      },
    );
  }
}
