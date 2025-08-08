import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Data/eventformat.dart'; // Using the event format file

class MainEventCard extends StatelessWidget {
  final Event event;
  final VoidCallback? onTap;

  const MainEventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            // Changed from Row to Column for vertical layout
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch children to full width
            children: [
              // Event image at the top
              Image.network(
                event.imageUrl,
                height: 200, // Increased height for a bigger image
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event date
                    Text(
                      event.date,
                      style: GoogleFonts.leagueSpartan(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Event title
                    Text(
                      event.title,
                      style: GoogleFonts.leagueSpartan(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Location icon
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        const SizedBox(width: 4),
                        // Event location
                        Expanded(
                          child: Text(
                            event.location,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
