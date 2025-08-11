import 'package:flutter/material.dart';

// The data model for a single restaurant.
class Restaurant {
  final String imageUrl;
  final String name;
  final String cuisine;
  final double rating;
  final String description;
  final bool bookTable;
  final String offer;
  final bool bucketlist;
  final String address;
  final int averageCost;
  final double userRating;

  const Restaurant({
    required this.imageUrl,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.description,
    required this.bookTable,
    required this.offer,
    required this.bucketlist,
    required this.address,
    required this.averageCost,
    required this.userRating,
  });
}

// List of all restaurants for the application.
final List<Restaurant> allRestaurants = const [
  Restaurant(
    imageUrl:
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'The Golden Spoon',
    cuisine: 'Modern European',
    rating: 4.8,
    description:
        'An elegant dining experience with a focus on seasonal ingredients and innovative culinary techniques. Perfect for special occasions and business dinners.',
    bookTable: true,
    offer:
        'Enjoy a complimentary glass of champagne with every booking before 7 PM.',
    bucketlist: false,
    address: '450 Park Avenue, New York, NY 10022',
    averageCost: 150,
    userRating: 0.0,
  ),
  Restaurant(
    imageUrl:
        'https://images.unsplash.com/photo-1517248135467-4c7edb731335?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Aroma Table',
    cuisine: 'Fusion, Tasting Menu',
    rating: 4.5,
    description:
        'A culinary journey blending flavors from East and West. Our 10-course tasting menu is a sensory exploration for the discerning palate.',
    bookTable: true,
    offer: 'Weekend special: Get 15% off the tasting menu for two.',
    bucketlist: true,
    address: '100 Broadway, New York, NY 10005',
    averageCost: 200,
    userRating: 0.0,
  ),
  Restaurant(
    imageUrl:
        'https://images.unsplash.com/photo-1549488344-9346571556a3?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Sushi Zen',
    cuisine: 'Japanese, Omakase',
    rating: 4.9,
    description:
        'A serene sushi bar offering an authentic omakase experience. Our master chefs prepare each piece with the freshest ingredients, creating a truly memorable meal.',
    bookTable: false,
    offer: 'N/A',
    bucketlist: false,
    address: '88 E 42nd St, New York, NY 10017',
    averageCost: 120,
    userRating: 0.0,
  ),
];
