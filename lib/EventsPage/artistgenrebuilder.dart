import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/artistgenreformat.dart'; // Import the new data file

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

// A single card widget for a genre grid item.
class GenreGridItem extends StatelessWidget {
  final Genre genre;

  const GenreGridItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to a filtered events page
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
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
      ),
    );
  }
}

// A widget to build a grid of genre cards.
class GenreGridViewBuilder extends StatelessWidget {
  final List<Genre> genres;

  const GenreGridViewBuilder({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disables inner scrolling
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Changed from 3 to 2 to increase item size
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1, // Makes the grid items square
      ),
      itemCount: genres.length,
      itemBuilder: (context, index) {
        return GenreGridItem(genre: genres[index]);
      },
    );
  }
}
