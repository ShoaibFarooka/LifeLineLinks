import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171212),
      appBar: AppBar(
        title: Text(
          'Notification',
          style: GoogleFonts.newsreader(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF171212),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funeral service for Michelle Rutherford',
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Saturday, October 15, 2022 at 10:00 AM',
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'St. Paul\'s Episcopal Church, 415 El Camino Real, Burlingame, CA 94010',
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Reception to Follow',
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle RSVP action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF04A24),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'RSVP',
                      style: GoogleFonts.newsreader(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Send Flowers action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF04A24),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Send Flowers',
                      style: GoogleFonts.newsreader(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: Image.asset(
                'assets/bear.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
