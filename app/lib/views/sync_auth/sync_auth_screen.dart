import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SyncAuthScreen extends StatelessWidget {
  const SyncAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171212),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.05), // Space at the top
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        //ADD FUNCTiONALITY
                      },
                      icon: const Icon(
                        Icons.clear_sharp,
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    Text(
                      'Apple Auth',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/syncAuthimg.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Stay in touch with your Network',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.newsreader(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "We'll notify you if someone in your network has passed away. We can also help you share your contacts with friends and family.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for "Continue with Apple" button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF04A24), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Continue with Apple'),
              ),
              const SizedBox(height: 20), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
