import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

// A single card widget for an artist.
class ArtistCard extends StatelessWidget {
  final Artist artist;

  const ArtistCard({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(artist.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            artist.name,
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

// A widget to build a horizontal list of artist cards.
class ArtistListViewBuilder extends StatelessWidget {
  final List<Artist> artists;

  const ArtistListViewBuilder({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Added a fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: artists.length,
        itemBuilder: (context, index) {
          return ArtistCard(artist: artists[index]);
        },
      ),
    );
  }
}

// A single card widget for a genre.
class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(genre.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            genre.name,
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

// A widget to build a horizontal list of genre cards.
class GenreListViewBuilder extends StatelessWidget {
  final List<Genre> genres;

  const GenreListViewBuilder({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Added a fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return GenreCard(genre: genres[index]);
        },
      ),
    );
  }
}

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

  const ChefListViewBuilder({super.key, required this.chefs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, // Adjusted height for the extra text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chefs.length,
        itemBuilder: (context, index) {
          return ChefCard(chef: chefs[index]);
        },
      ),
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

// A widget to build a horizontal list of food chain cards.
class FoodChainListViewBuilder extends StatelessWidget {
  final List<FoodChain> foodChains;

  const FoodChainListViewBuilder({super.key, required this.foodChains});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodChains.length,
        itemBuilder: (context, index) {
          return FoodChainCard(foodChain: foodChains[index]);
        },
      ),
    );
  }
}
