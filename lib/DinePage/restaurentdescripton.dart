import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj1/Data/dineindatafromat.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late bool isTableBooked;
  late bool isBucketListed;
  double _userRating = 0.0; // Added state for user rating

  @override
  void initState() {
    super.initState();
    isTableBooked = !widget.restaurant.bookTable;
    isBucketListed = widget.restaurant.bucketlist;
  }

  void _toggleBooking() {
    setState(() {
      isTableBooked = !isTableBooked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isTableBooked ? 'Table booked successfully!' : 'Booking canceled.',
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

  void _rateRestaurant(double newRating) {
    setState(() {
      _userRating = newRating;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You rated this restaurant $_userRating stars!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurant.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.restaurant.imageUrl,
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
                    widget.restaurant.name,
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.restaurant.rating} / 5',
                        style: GoogleFonts.leagueSpartan(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.restaurant.cuisine,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const Divider(height: 32),
                  Text(
                    'About the Restaurant',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.restaurant.description,
                    style: GoogleFonts.leagueSpartan(fontSize: 16),
                  ),
                  if (widget.restaurant.offer.isNotEmpty) ...[
                    const Divider(height: 32),
                    Text(
                      'Special Offer',
                      style: GoogleFonts.leagueSpartan(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.restaurant.offer,
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 16,
                        color: Colors.lightGreen,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  const Divider(height: 32),
                  Text(
                    'Rate this Restaurant',
                    style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _userRating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () => _rateRestaurant(index + 1.0),
                      );
                    }),
                  ),
                  if (_userRating > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Your Rating: $_userRating / 5',
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: widget.restaurant.bookTable
          ? Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _toggleBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isTableBooked
                            ? Colors.red
                            : Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        isTableBooked ? 'Cancel Booking' : 'Book a Table',
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
            )
          : const SizedBox(),
    );
  }
}
