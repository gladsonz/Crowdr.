import 'package:flutter/material.dart';

// The data model for a single event.
class Event {
  final String imageUrl;
  final String date;
  final String title;
  final String location;
  final String description;
  final double kidsPrice;
  final double adultsPrice;
  final String offer;
  final bool isBooked;
  final bool bucketlist;

  const Event({
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.location,
    required this.description,
    required this.kidsPrice,
    required this.adultsPrice,
    required this.offer,
    required this.isBooked,
    required this.bucketlist,
  });
}

// List of all events for the application.
// This data can be accessed from any page that imports this file.
final List<Event> allEvents = const [
  Event(
    imageUrl:
        'https://placehold.co/600x400/9b59b6/white?text=Neon+Wave+Festival',
    date: '28 MAY',
    title: 'Neon Wave Festival',
    location: 'The Electric Forest, New York',
    description:
        'An immersive night of pulsating techno and trance beats with a state-of-the-art light show and hypnotic visuals. Featuring world-renowned DJs on multiple stages.',
    kidsPrice: 0.0,
    adultsPrice: 120.00,
    offer: 'VIP Access: Skip the line and get a free drink! +50',
    isBooked: false,
    bucketlist: false,
  ),
  Event(
    imageUrl:
        'https://placehold.co/600x400/3498db/white?text=Cosmic+Groove+EDM',
    date: '12 JUN',
    title: 'Cosmic Groove EDM Night',
    location: 'Metropolis Stadium, New York',
    description:
        'Experience an unforgettable journey through sound with our lineup of progressive house and dubstep artists. The night will feature pyrotechnics and a massive laser display.',
    kidsPrice: 0.0,
    adultsPrice: 85.00,
    offer: 'Group Special: Buy 4 tickets, get the 5th for free!',
    isBooked: false,
    bucketlist: true,
  ),
  Event(
    imageUrl:
        'https://placehold.co/600x400/f1c40f/white?text=Future+Sound+Rave',
    date: '05 JUL',
    title: 'Future Sound Rave',
    location: 'Warehouse District, New York',
    description:
        'A secret warehouse party with a focus on underground house and experimental electronic music. This event is strictly 18+ and will be a night of pure dance music euphoria.',
    kidsPrice: 0.0,
    adultsPrice: 50.00,
    offer: 'Early Bird Special: 30% off for the first 100 tickets sold.',
    isBooked: true,
    bucketlist: false,
  ),
];
