import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj1/Data/eventformat.dart'; // Ensure correct path to your Event model

class HomePageCard extends StatelessWidget {
  final Event event;
  final VoidCallback? onTap;

  const HomePageCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 300, // Adjusted height to accommodate the vertical layout
            width: 250, // Fixed width for horizontal scrolling
            child: Column(
              // Changed from Row to Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event image
                Image.network(
                  event.imageUrl,
                  height: 180, // Height for the main image
                  width:
                      double.infinity, // Expand to fill the width of the card
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Event title
                      Text(
                        event.title,
                        style: GoogleFonts.leagueSpartan(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 8),
                      // Event location
                      Text(
                        event.location,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
