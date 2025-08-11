import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User {
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // This is a placeholder for user authentication state.
  // In a real app, this would be managed by a state management solution
  // and check against a real authentication service (e.g., Firebase Auth).
  bool _isLoggedIn = false;
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    // Simulate a logged-in user
    _currentUser = const User(
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatarUrl: 'https://placehold.co/100x100/png',
    );
  }

  void _signIn() {
    setState(() {
      _isLoggedIn = true;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('You have been signed in.')));
  }

  void _signOut() {
    setState(() {
      _isLoggedIn = false;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('You have been signed out.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.leagueSpartan(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: _isLoggedIn ? _buildUserProfile() : _buildSignInPrompt(),
    );
  }

  Widget _buildUserProfile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_currentUser.avatarUrl),
                ),
                const SizedBox(height: 16),
                Text(
                  _currentUser.name,
                  style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _currentUser.email,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _signOut,
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('My Events'),
            onTap: () {
              // TODO: Implement navigation to MyEventsPage
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('My Restaurants'),
            onTap: () {
              // TODO: Implement navigation to a page showing saved restaurants
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: Implement navigation to settings page
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSignInPrompt() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 100, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Sign in to view your profile',
            style: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _signIn, child: const Text('Sign In')),
        ],
      ),
    );
  }
}
