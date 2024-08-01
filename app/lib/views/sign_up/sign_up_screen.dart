import 'package:flutter/material.dart';
import 'package:funeral_app/services/signup_provider.dart';
import 'package:funeral_app/views/sync_contacts/sync_contacts_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

          return Scaffold(
            backgroundColor: const Color(0xFF171212),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                        height:
                            60), // Add some spacing to push the content down
                    Center(
                      child: Image.asset(
                        'assets/logo.png', // Make sure you have your logo image in assets
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        InkWell(
                          onTap:(){
                             context.pop();
                          }
,
                          child: const Icon(Icons.arrow_back,color: Colors.white,)),
                        Center(
                          child: Text(
                            'Create an Account',
                            style: GoogleFonts.newsreader(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: fullNameController,
                      
                      style: GoogleFonts.newsreader(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        filled: true,
                        fillColor: const Color(0xFF382B29),
                        hintStyle: GoogleFonts.newsreader(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneNumberController,
                      style: GoogleFonts.newsreader(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        filled: true,
                        fillColor: const Color(0xFF382B29),
                        hintStyle: GoogleFonts.newsreader(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      style: GoogleFonts.newsreader(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        filled: true,
                        fillColor: const Color(0xFF382B29),
                        hintStyle: GoogleFonts.newsreader(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: GoogleFonts.newsreader(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: const Color(0xFF382B29),
                        hintStyle: GoogleFonts.newsreader(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                      ElevatedButton(
                        onPressed: ()async{
                        await  signupProvider.signup(emailController.text.toString(),passwordController.text.toString(),phoneNumberController.text.toString(),fullNameController.text.toString());
                          signupProvider.status?
                            Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) =>  const SyncContactsScreen()),
      ):showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF04A24),
            title: Text('Error',style:  GoogleFonts.newsreader()),
            content: Text((signupProvider.errorMessage),style: GoogleFonts.newsreader(),),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );}
      );},
                         
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFF04A24), // Button color
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: signupProvider.loading ? const CircularProgressIndicator(): Text('Continue',style: GoogleFonts.newsreader(color: Colors.white)),
                      ),
                    const SizedBox(
                        height: 20), // Add some spacing at the bottom
                  ],
                ),
              ),
            ),
          );
        }
  }
