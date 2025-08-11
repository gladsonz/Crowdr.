import 'package:flutter/material.dart';
import '../Data/eventformat.dart';
import 'package:proj1/EventsPage/maincard.dart'; // Ensure correct path
import 'eventspage.dart';
import 'eventdescripton.dart'; // Import the EventDetailsScreen

class EventsList extends StatelessWidget {
  final List<Event> events;

  const EventsList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // This is the fix to prevent layout overflow
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return MainEventCard(
          event: event,
          onTap: () {
            // Handle tap event, for example, navigate to a details page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EventDetailsScreen(event: event),
              ),
            );
          },
        );
      },
    );
  }
}
