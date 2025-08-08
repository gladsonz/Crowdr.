import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proj1/Data/eventformat.dart';
import 'package:proj1/Data/dineindatafromat.dart';
import 'package:proj1/EventsPage/eventdescripton.dart';
import 'package:proj1/DinePage/restaurentdescripton.dart';
import 'package:proj1/EventsPage/eventspage.dart';
import 'package:proj1/DinePage/dinepage.dart';
import 'package:proj1/MyEventsPage/myevents.dart'; // Import the new card widget
// import 'chatbot.dart';
// import 'myevents.dart';
import 'package:proj1/SignupPage/profile.dart';

import 'homepagemaincard.dart';
import 'homeoagerestcard.dart';
import 'homevenstlistviewbulder.dart';
import 'package:proj1/main.dart'; // assuming themeNotifier is defined here

// Placeholder for the RestaurantDetailsScreen

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'crowdr.',
            style: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 8),
                    Text('New York', style: GoogleFonts.leagueSpartan()),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        themeNotifier.value =
                            themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      },
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.account_circle_outlined),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.nightlife_outlined), text: 'Events'),
                  Tab(icon: Icon(Icons.restaurant_outlined), text: 'Dine'),
                  Tab(
                    icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                    text: 'Chatbot',
                  ),
                  Tab(icon: Icon(Icons.event), text: 'My Events'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Trending Events',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: HomepageListViewBuilder(
                  items: allEvents,
                  cardBuilder: (item) => HomePageCard(event: item as Event),
                  onTap: (item) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsScreen(event: item as Event),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Trending Restaurants',
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: HomepageListViewBuilder(
                  items: allRestaurants,
                  cardBuilder: (item) {
                    return HomePageRestaurantCard(
                      restaurant: item as Restaurant,
                    );
                  },
                  onTap: (item) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailsScreen(
                          restaurant: item as Restaurant,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const EventsPage(),
          const DinePage(),
          const Text('Chatbot Tab', style: TextStyle(fontSize: 24)),
          const MyEventsPage(),
        ],
      ),
    );
  }
}
