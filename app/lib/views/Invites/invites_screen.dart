
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:funeral_app/services/send_invites_provider.dart';
import 'package:funeral_app/services/signup_provider.dart';
import 'package:funeral_app/views/Invites/invites_view_model.dart';
import 'package:provider/provider.dart';

import '../requests/requests_screen.dart'; // Adjust the import path based on your project structure

class InvitesPage extends StatelessWidget {
  const InvitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    final sendinvitesProvider = Provider.of<SendInvitesProvider>(context);

    // Instantiate InvitesViewModel with SelectedContactsProvider
    InvitesViewModel invitesViewModel = InvitesViewModel();

    // Fetch contacts when the page is built
    invitesViewModel.fetchContacts();

    return ChangeNotifierProvider.value(
      value: invitesViewModel,
      child: Scaffold(
        backgroundColor: const Color(0xFF171212),
        appBar: AppBar(
          title: const Text(
            'Invite Contacts',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF171212),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Consumer<InvitesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.contact.isEmpty) {
              return const Center(
                child: Text('No Contacts',style: TextStyle(color: Colors.white, fontSize: 20),)
                // CircularProgressIndicator(
                //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                // ),
              );
            } else {
              return ListView.builder(
                itemCount: viewModel.contact.length,
                itemBuilder: (context, index) {
                  Contact contact = viewModel.contact[index];

                  // Determine if contact is selected
                  // Access isSelected from SelectedContactsProvider
                  bool isSelected =
                      viewModel.selectedContacts.contains(contact);

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(contact.displayName[0]),
                    ),
                    title: Text(
                      contact.displayName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      contact.phones.isNotEmpty
                          ? contact.phones.first.number
                          : 'No Phone',
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (_) {},
                      activeColor: const Color(0xFFF04A24),
                    ),
                    onTap: () {
                      invitesViewModel.toggleContactSelection(contact);
                     // print(StaticData.token);
                  //    print(invitesViewModel.selectedContacts.length);
                      //print(false);
                    },
                  );
                },
              );
            }
          },
        ),
        
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            
            List<Map<dynamic,String>> invitees = [];

            // Prepare invitees list with selected contacts
            invitesViewModel.selectedContacts.forEach((contact) {
              invitees.add({
                'name': contact.displayName,
                'number': contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : '',
              });
            });

            // Send invites using SendInvitesProvider
            if(invitesViewModel.selectedContacts.isNotEmpty){
              sendinvitesProvider.sendInvites(signupProvider.token, invitees);

            _sendInvites(context, invitesViewModel.selectedContacts);
            } else {
            _sendInvites(context, invitesViewModel.selectedContacts);

            }

            
            
          },
          label:  const Text('Send Invites'),
          backgroundColor: const Color(0xFFF04A24),
          icon: const Icon(Icons.send, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _sendInvites(BuildContext context, List<Contact> selectedContacts) {
    if (selectedContacts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one contact to send invites.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RequestsPage(),
          ),
        );
    }
  }
}

