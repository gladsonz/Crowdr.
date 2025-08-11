import 'package:flutter/material.dart';

// The data model for a single artist.
class Artist {
  final String name;
  final String imageUrl;

  const Artist({required this.name, required this.imageUrl});
}

// The data model for a single genre.
class Genre {
  final String name;
  final String imageUrl;

  const Genre({required this.name, required this.imageUrl});
}

// Placeholder list of artists.
final List<Artist> allArtists = const [
  Artist(name: 'DJ Solstice', imageUrl: 'https://placehold.co/100x100/png'),
  Artist(name: 'Anika', imageUrl: 'https://placehold.co/100x100/png'),
  Artist(name: 'Bassline B.', imageUrl: 'https://placehold.co/100x100/png'),
  Artist(name: 'Synthwave Sam', imageUrl: 'https://placehold.co/100x100/png'),
  Artist(name: 'Future Funk', imageUrl: 'https://placehold.co/100x100/png'),
];

// Placeholder list of genres.
final List<Genre> allGenres = const [
  Genre(
    name: 'Techno',
    imageUrl: 'https://placehold.co/100x100/34495e/white?text=Techno',
  ),
  Genre(
    name: 'Trance',
    imageUrl: 'https://placehold.co/100x100/f1c40f/white?text=Trance',
  ),
  Genre(
    name: 'House',
    imageUrl: 'https://placehold.co/100x100/e74c3c/white?text=House',
  ),
  Genre(
    name: 'Dubstep',
    imageUrl: 'https://placehold.co/100x100/2ecc71/white?text=Dubstep',
  ),
  Genre(
    name: 'Hip Hop',
    imageUrl: 'https://placehold.co/100x100/9b59b6/white?text=Hip+Hop',
  ),
];
