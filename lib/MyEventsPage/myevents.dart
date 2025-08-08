import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/Data/dineindatafromat.dart';
import 'package:proj1/EventsPage/eventdescripton.dart';
import 'package:proj1/DinePage/restaurentdescripton.dart';
import 'package:proj1/EventsPage/eventspage.dart';
import 'package:proj1/DinePage/dinepage.dart';
import 'myeventscard.dart'; // Import the new card widget

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  List<Event> bookedEvents = [];
  List<Restaurant> bookedRestaurants = [];
  List<Event> bucketListEvents = [];
  List<Restaurant> bucketListRestaurants = [];

  @override
  void initState() {
    super.initState();
    _filterUserLists();
  }

  void _filterUserLists() {
    setState(() {
      // Filter for booked events and restaurants
      bookedEvents = allEvents.where((event) => event.isBooked).toList();
      bookedRestaurants = allRestaurants
          .where((restaurant) => restaurant.bookTable)
          .toList();

      // Filter for bucket list events and restaurants
      bucketListEvents = allEvents.where((event) => event.bucketlist).toList();
      bucketListRestaurants = allRestaurants
          .where((restaurant) => restaurant.bucketlist)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasContent =
        bookedEvents.isNotEmpty ||
        bookedRestaurants.isNotEmpty ||
        bucketListEvents.isNotEmpty ||
        bucketListRestaurants.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Activities',
          style: GoogleFonts.leagueSpartan(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (bookedEvents.isNotEmpty) ...[
                Text(
                  'Booked Events',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                ...bookedEvents
                    .map((event) => MyEventsCard(item: event))
                    .toList(),
                const Divider(height: 32),
              ],
              if (bookedRestaurants.isNotEmpty) ...[
                Text(
                  'Booked Restaurants',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                ...bookedRestaurants
                    .map((restaurant) => MyEventsCard(item: restaurant))
                    .toList(),
                const Divider(height: 32),
              ],
              if (bucketListEvents.isNotEmpty) ...[
                Text(
                  'Bucket List Events',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                ...bucketListEvents
                    .map((event) => MyEventsCard(item: event))
                    .toList(),
                const Divider(height: 32),
              ],
              if (bucketListRestaurants.isNotEmpty) ...[
                Text(
                  'Bucket List Restaurants',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                ...bucketListRestaurants
                    .map((restaurant) => MyEventsCard(item: restaurant))
                    .toList(),
              ],
              if (!hasContent)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Text(
                      'You have no booked events or bucket list items.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
