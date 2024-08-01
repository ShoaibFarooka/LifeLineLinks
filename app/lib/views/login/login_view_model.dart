// import 'package:flutter/material.dart';

// class LoginViewModel extends ChangeNotifier {
//   final BuildContext _context;
//   String _email = '';
//   String _password = '';
//   bool _isLoading = false;
//   String? _errorMessage;

//   LoginViewModel(this._context);

//   // Getters
//   String get email => _email;
//   String get password => _password;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   // Setters
//   void setEmail(String email) {
//     _email = email;
//     notifyListeners();
//   }

//   void setPassword(String password) {
//     _password = password;
//     notifyListeners();
//   }

//   // Simulated sign-up method
//   Future<void> login() async {
//     if (_email.isEmpty ||
//         _password.isEmpty) {
//       _errorMessage = 'All fields are required';
//       notifyListeners();
//       return;
//     }

//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     // Simulating network request delay
//     await Future.delayed(const Duration(seconds: 2));

//     // Simulating successful sign-up
//     _isLoading = false;
//     notifyListeners();

//     // Navigate to Sync Contacts page after successful sign-up
//     // ignore: use_build_context_synchronously
//     Navigator.pushReplacementNamed(_context, '/syncContacts');
//   }
// }
