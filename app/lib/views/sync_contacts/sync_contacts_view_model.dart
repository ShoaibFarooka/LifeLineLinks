import 'package:flutter/material.dart';

import '../Invites/invites_screen.dart';

class SyncContactsViewModel extends ChangeNotifier {
  final BuildContext context;

  SyncContactsViewModel(this.context);

  void navigateToSignUp() {
    Navigator.of(context).pushReplacementNamed('/signup');
  }

  void navigateToInvites() {
    // Replace this with navigation logic to the invites page
    // Navigator.of(context).pushReplacementNamed('/invites');
    // Example navigation to a new route
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const InvitesPage()));
  }
}
