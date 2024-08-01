import 'package:flutter/material.dart';
import 'package:funeral_app/services/login_provider.dart';
import 'package:funeral_app/views/requests/requests_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    // return ChangeNotifierProvider(
    //  create: (_) => LoginViewModel(context),
    //   child: Consumer<LoginViewModel>(
    //     builder: (context, viewModel, child) {
          
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
                    Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.newsreader(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                   
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                    //  onChanged: viewModel.setEmail,
                      style: GoogleFonts.newsreader(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                    //  onChanged: viewModel.setPassword,
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
                    // if (viewModel.errorMessage != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 8.0),
                    //     child: Text(
                    //       viewModel.errorMessage!,
                    //       style: const TextStyle(color: Colors.red),
                    //     ),
                    //   ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                         Text('Not a Member?',style: GoogleFonts.newsreader(
                         
                          color: Colors.white,
                        )),
                        TextButton(onPressed: (){
                          context.push('/signUp');
                        }, child:  Text("SignUp",style:  GoogleFonts.newsreader(
                         
                           color: const Color(0xFFF04A24),
                        )))
                      ],
                    ),
                    const SizedBox(height: 10),
                    // if (viewModel.isLoading)
                    //    Center(
                    //       child: CircularProgressIndicator(
                    //     color: Color(0xFFF04A24),
                    //   ))
                    //else
                      ElevatedButton(
                        onPressed:()async{
                          await loginProvider.login(emailController.text.toString(),passwordController.text.toString());
                        if(loginProvider.status){
                          Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const RequestsPage()),
      ); 
                        }else if(loginProvider.errorMessage.isNotEmpty){
                           showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF04A24),
            title: Text('Error',style:  GoogleFonts.newsreader()),
            content: Text((loginProvider.errorMessage),style: GoogleFonts.newsreader(),),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );}
      );
                         }
      //                   Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const RequestsPage()
      //   ),
      // );   
              } ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                               const Color(0xFFF04A24), // Button color
                          padding:  const EdgeInsets.symmetric(vertical: 16),
                          textStyle:  const TextStyle(fontSize: 18),
                        ),
                        child: loginProvider.loading ? const CircularProgressIndicator():  Text('Login',style: GoogleFonts.newsreader(color: Colors.white)),
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
