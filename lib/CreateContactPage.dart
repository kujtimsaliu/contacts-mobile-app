// create_contact_page.dart
import 'package:flutter/material.dart';
import 'ContactManager.dart';

import 'Contact.dart';

class CreateContactPage extends StatefulWidget {
  @override
  _CreateContactPageState createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),

            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  _addressController.text =
                      ''; // Default value for an empty address
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailAddressController,
              decoration: const InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  // If the field is empty,i set a default value to avoid null errors when creating a Contact object
                  _addressController.text = '';
                }
                return null;
              },
            ),
            // Add the text field for the address
            const SizedBox(height: 15),

            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  //same
                  _addressController.text =
                      ''; // default value for an empty address
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Contact newContact = Contact(
                      name: _nameController.text,
                      surname: _surnameController.text,
                      phoneNumber: _phoneNumberController.text,
                      emailAddress: _emailAddressController.text,
                      address: _addressController.text);
                  ContactManager().addContact(newContact);
                  Navigator.pushReplacementNamed(context, '/contactList');
                }
              },
              child: const Text('Create Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
