import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Data/eventformat.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late bool isBooked;
  late bool isBucketListed;

  @override
  void initState() {
    super.initState();
    isBooked = widget.event.isBooked;
    isBucketListed = widget.event.bucketlist;
  }

  void _bookEvent() {
    setState(() {
      isBooked = !isBooked;
    });
    // In a real app, you would also handle the booking logic here
    // e.g., make an API call to book the ticket.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isBooked ? 'Event booked successfully!' : 'Booking canceled.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleBucketList() {
    setState(() {
      isBucketListed = !isBucketListed;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isBucketListed
              ? 'Added to bucket list!'
              : 'Removed from bucket list.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.event.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.event.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.title,
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.event.location,
                        style: GoogleFonts.leagueSpartan(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.event.date,
                        style: GoogleFonts.leagueSpartan(fontSize: 16),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  Text(
                    'About the Event',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.event.description,
                    style: GoogleFonts.leagueSpartan(fontSize: 16),
                  ),
                  const Divider(height: 32),
                  Text(
                    'Tickets & Offers',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Adults: \$${widget.event.adultsPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.leagueSpartan(fontSize: 16),
                  ),
                  Text(
                    'Kids: \$${widget.event.kidsPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.leagueSpartan(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Offer: ${widget.event.offer}',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 16,
                      color: Colors.lightGreen,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _bookEvent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isBooked ? Colors.red : Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  isBooked ? 'Cancel Booking' : 'Book Now',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: Icon(
                isBucketListed ? Icons.bookmark : Icons.bookmark_border,
                color: isBucketListed ? Colors.yellow : null,
              ),
              onPressed: _toggleBucketList,
              style: IconButton.styleFrom(
                minimumSize: const Size(50, 50),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
