import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final _pinControllers = List<TextEditingController>.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _pinControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171212),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Enter Life Code',
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: _pinControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle next action
                  // ignore: unused_local_variable
                  String otp = _pinControllers
                      .map((e) => e.text)
                      .join(); //USE THE OTP
                  // Use the OTP as needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF04A24),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.newsreader(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
