import 'package:flutter/material.dart';

// The data model for a single chef.
class Chef {
  final String name;
  final String imageUrl;
  final String specialty;

  const Chef({
    required this.name,
    required this.imageUrl,
    required this.specialty,
  });
}

// The data model for a single food chain.
class FoodChain {
  final String name;
  final String imageUrl;

  const FoodChain({required this.name, required this.imageUrl});
}

// Placeholder list of chefs.
final List<Chef> allChefs = const [
  Chef(
    name: 'Gordon Ramsey',
    imageUrl: 'https://placehold.co/100x100/FF0000/white?text=Chef+1',
    specialty: 'Fine Dining',
  ),
  Chef(
    name: 'Wolfgang Puck',
    imageUrl: 'https://placehold.co/100x100/00FF00/white?text=Chef+2',
    specialty: 'Fusion Cuisine',
  ),
  Chef(
    name: 'Jamie Oliver',
    imageUrl: 'https://placehold.co/100x100/0000FF/white?text=Chef+3',
    specialty: 'Italian',
  ),
];

// Placeholder list of food chains.
final List<FoodChain> allFoodChains = const [
  FoodChain(
    name: 'McDonalds',
    imageUrl: 'https://placehold.co/100x100/FFD700/black?text=M',
  ),
  FoodChain(
    name: 'Dominos',
    imageUrl: 'https://placehold.co/100x100/4169E1/white?text=D',
  ),
  FoodChain(
    name: 'Subway',
    imageUrl: 'https://placehold.co/100x100/006400/white?text=S',
  ),
];
