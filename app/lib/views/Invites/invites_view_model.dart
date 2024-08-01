import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class InvitesViewModel extends ChangeNotifier {
  final List<Contact> _contacts = [];
  final List<Contact> _selectedContacts = [];

  List<Contact> get selectedContacts => _selectedContacts;

  void addSelectedContact(Contact contact) {
    _selectedContacts.add(contact);
  }

  void removeSelectedContact(Contact contact) {
    _selectedContacts.remove(contact);
  }

  List<Contact> get contacts => _contacts;
  List<Contact> contact = [];
  // Reference to the selected contacts provider

  InvitesViewModel(); // Constructor to inject SelectedContactsProvider

  Future<void> fetchContacts() async {
    try {
      // Request contact permission
      bool hasPermission = await FlutterContacts.requestPermission(
        readonly: true,
      );
      if (hasPermission) {
        // Get all contacts (lightly fetched)
        contact = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
        );
        notifyListeners(); // Notify listeners of changes
      } else {
        // Handle case where permission is denied
       // print('Permission denied for contacts');
      }
    } catch (e) {
      // Handle any errors that occur during contact fetching
      //print('Error fetching contacts: $e');
    }
  }

  void toggleContactSelection(Contact contact) {
    if (selectedContacts.contains(contact)) {
      removeSelectedContact(contact);
    } else {
      addSelectedContact(contact);
    }
    notifyListeners(); // Notify listeners of changes
  }
}
