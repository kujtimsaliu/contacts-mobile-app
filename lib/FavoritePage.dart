import 'package:crud_ops_contactlist_app/ContactManager.dart';
import 'package:flutter/material.dart';
import 'Contact.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Contact> contacts = ContactManager().contacts;

  // const FavoritesPage({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // filtering the contacts to only include favorites
    final favoriteContacts =
        contacts.where((contact) => contact.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Contacts'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 3,
        ),
        itemCount: favoriteContacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = favoriteContacts[index];
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Text(
                    contact.name[0],
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Text(contact.name),
                const Text('Mobile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
