import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/EventsPage/maincard.dart';
import 'package:proj1/EventsPage/evenstlistviewbulder.dart';
import 'package:proj1/EventsPage/eventdescripton.dart';
import 'package:proj1/Data/artistgenreformat.dart';
import 'package:proj1/EventsPage/artistgenrebuilder.dart';
import 'package:proj1/EventsPage/organizeevnt.dart';
// Placeholder for the organize events page

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String _eventsNearMeFilter = '';

  @override
  Widget build(BuildContext context) {
    // Filtered events for the "Events Near Me" section
    final eventsNearMe = allEvents.where((event) {
      if (_eventsNearMeFilter.isEmpty) {
        return true;
      }
      return event.location.toLowerCase().contains(
        _eventsNearMeFilter.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Events',
          style: GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended Events',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            // Reusing EventsList for Recommended Events
            EventsList(events: allEvents),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genres',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GenreGridViewBuilder(genres: allGenres),
                  const SizedBox(height: 24),
                  Text(
                    'Trending Events',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Reusing EventsList for Trending Events
                  EventsList(
                    events: allEvents,
                  ), // Assuming trending events are a subset of allEvents
                  const SizedBox(height: 24),
                  Text(
                    'Artists',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ArtistListViewBuilder(artists: allArtists),
                  const SizedBox(height: 24),
                  Text(
                    'Events Near Me',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        hintText: 'Search events near you...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _eventsNearMeFilter = value;
                        });
                      },
                    ),
                  ),
                  // Reusing EventsList for filtered events
                  EventsList(events: eventsNearMe),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OrganizeEventsPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            'Organize an Event',
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
