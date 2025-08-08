import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/dineindatafromat.dart';
import 'dinecard.dart';
import 'dinelistviewbuilder.dart';

// Placeholder for the organize restaurants page
class OrganizeRestaurantPage extends StatelessWidget {
  const OrganizeRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a Restaurant')),
      body: const Center(
        child: Text('This is the page for restaurant owners.'),
      ),
    );
  }
}

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                hintText: 'Search restaurants near you...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
              onChanged: (value) {
                setState(() {
                  _filterLocation = value;
                });
              },
            ),
          ),
          Expanded(
            child: DineListViewBuilder(restaurants: filteredRestaurants),
          ),
        ],
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
