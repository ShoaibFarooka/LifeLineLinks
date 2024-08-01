import 'package:flutter/material.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:funeral_app/views/requests/requests_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sync_contacts_view_model.dart';

class SyncContactsScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const SyncContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SyncContactsViewModel viewModel = SyncContactsViewModel(context);
  UserPreferences userPreferences = UserPreferences();


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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear_sharp,
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    const Text(
                      'Sync Contacts',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
              const SizedBox(width: 20),

                       ElevatedButton(onPressed: (){
              userPreferences.logout(context);
             }, child:  Text('Logout', style: GoogleFonts.newsreader(color: Colors.black)))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.white),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      "We'll never store your password or contacts",
                      style: GoogleFonts.splineSans(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // Handle arrow forward button functionality if needed
                      },
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Securely sync your phone\'s contact list with the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your contacts will be used to customize your experience, including helping you find friends and family on the app.',
                textAlign: TextAlign.center,
                style: GoogleFonts.splineSans(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your contacts will be used to customize your experience, including helping you find friends and family on the app.',
                textAlign: TextAlign.center,
                style: GoogleFonts.splineSans(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  viewModel.navigateToInvites();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF04A24), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: GoogleFonts.newsreader(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RequestsPage()),
      ); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF472924), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: GoogleFonts.newsreader(
                    fontSize: 18,
                    color: Colors.white,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                child: Text(
                  'Not Now',
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    color: Colors.white,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20), // Add some spacing at the bottom
              const SizedBox(
                  height: 60), // Add some spacing to push the content down
              Center(
                child: Image.asset(
                  'assets/bear.png', // Make sure you have your logo image in assets
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
