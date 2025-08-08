import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/EventsPage/eventdescripton.dart';
import 'package:proj1/DinePage/restaurentdescripton.dart';
import 'package:proj1/EventsPage/eventspage.dart';
import 'package:proj1/DinePage/dinepage.dart';
import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/Data/dineindatafromat.dart';

class MyEventsCard extends StatelessWidget {
  final dynamic item;

  const MyEventsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item is Event) {
      final Event event = item;
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventDetailsScreen(event: event),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Hero(
              tag: 'event-${event.title}',
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(event.imageUrl),
              ),
            ),
            title: Text(
              event.title,
              style: GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${event.location} • ${event.date}',
              style: GoogleFonts.leagueSpartan(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      );
    } else if (item is Restaurant) {
      final Restaurant restaurant = item;
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  RestaurantDetailsScreen(restaurant: restaurant),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Hero(
              tag: 'restaurant-${restaurant.name}',
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(restaurant.imageUrl),
              ),
            ),
            title: Text(
              restaurant.name,
              style: GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${restaurant.cuisine} • ${restaurant.rating.toStringAsFixed(1)} ★',
              style: GoogleFonts.leagueSpartan(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
