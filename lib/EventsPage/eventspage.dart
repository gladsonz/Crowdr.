import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/EventsPage/maincard.dart';
import 'package:proj1/EventsPage/listviewbuilderall.dart';
import 'package:proj1/EventsPage/eventdescripton.dart';
import 'package:proj1/Data/artistchefgenrecardandlistviewbuilder.dart';

// Placeholder for the organize events page
class OrganizeEventsPage extends StatelessWidget {
  const OrganizeEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Organize an Event')),
      body: const Center(
        child: Text('This is the page to organize a new event.'),
      ),
    );
  }
}

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String _filterLocation = '';

  @override
  Widget build(BuildContext context) {
    final filteredEvents = allEvents.where((event) {
      if (_filterLocation.isEmpty) {
        return true;
      }
      return event.location.toLowerCase().contains(
        _filterLocation.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Events',
          style: GoogleFonts.leagueSpartan(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  _filterLocation = value;
                });
              },
            ),
          ),
          Expanded(child: EventsList(events: filteredEvents)),
        ],
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
