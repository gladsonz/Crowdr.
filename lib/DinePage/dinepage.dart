import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/dineindatafromat.dart';
import 'dinecard.dart';
import 'dinelistviewbuilder.dart';
import 'package:proj1/Data/chefchainsformat.dart';
import 'package:proj1/DinePage/chefchainbuilder.dart';
import 'package:proj1/DinePage/dinelistviewbuilder.dart';

import 'package:proj1/DinePage/addrestarent.dart';

class DinePage extends StatefulWidget {
  const DinePage({super.key});

  @override
  State<DinePage> createState() => _DinePageState();
}

class _DinePageState extends State<DinePage> {
  String _filterLocation = '';

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = allRestaurants.where((restaurant) {
      if (_filterLocation.isEmpty) {
        return true;
      }
      return restaurant.address.toLowerCase().contains(
        _filterLocation.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dine In',
          style: GoogleFonts.leagueSpartan(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Restaurants
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Trending Restaurants',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: DineListViewBuilder(
                restaurants: allRestaurants,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(height: 24),
            // Top Chefs
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Top Chefs',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 170,
              child: ChefListViewBuilder(
                chefs: allChefs,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(height: 24),
            // Popular Food Chains
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Popular Food Chains',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: FoodChainGridViewBuilder(
                foodChains: allFoodChains,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(height: 24),
            // Recommended Restaurants
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Recommended Restaurants',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            DineListViewBuilder(
              restaurants: allRestaurants,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            const SizedBox(height: 24),
            // Hidden Gems
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Hidden Gems',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            DineListViewBuilder(
              restaurants: allRestaurants.reversed.toList(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OrganizeRestaurantPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            'Add a Restaurant (Owner)',
            style: GoogleFonts.leagueSpartan(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
