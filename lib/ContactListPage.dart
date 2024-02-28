import 'package:flutter/material.dart';
import 'ContactDetailPage.dart';
import 'ContactEditPage.dart';
import 'Contact.dart';
import 'ContactManager.dart';
import 'dart:math';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final TextEditingController searchController = TextEditingController();
  final List<Contact> contacts = ContactManager().contacts;
  List<Contact> filteredContacts = ContactManager().contacts;

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    List<Contact> _filtered = contacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredContacts = _filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search Contacts',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
                _filterContacts('');
              },
            ),
          ),
          onChanged: _filterContacts,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            filteredContacts.isEmpty
                ? const Text('No contacts found.',
                    style: TextStyle(fontSize: 20))
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        return _buildContactRow(filteredContacts[index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(Contact contact) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _randomColor(),
          child: Text(
            contact.name[0],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text('${contact.name} ${contact.surname}'),
        trailing: IconButton(
          icon: Icon(Icons.call),
          color: Colors.green, // Settin the colr of the call icon
          onPressed: () {
            //calling....
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailPage(
                contact: contact,
                onDelete: () {
                  setState(() {
                    ContactManager().contacts.remove(contact);
                  });
                  Navigator.pop(context);
                },
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactEditPage(
                        contact: contact,
                        onUpdate: (updatedContact) {
                          setState(() {
                            int index =
                                ContactManager().contacts.indexOf(contact);
                            if (index != -1) {
                              ContactManager().contacts[index] = updatedContact;
                            }
                          });
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Color _randomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
}
