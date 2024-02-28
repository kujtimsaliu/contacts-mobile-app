import 'package:flutter/material.dart';
import 'Contact.dart';

// ContactEditPage Widget
class ContactEditPage extends StatefulWidget {
  final Contact contact;
  final Function(Contact) onUpdate;

  const ContactEditPage({
    Key? key,
    required this.contact,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _ContactEditPageState createState() => _ContactEditPageState();
}

class _ContactEditPageState extends State<ContactEditPage> {
  late bool isFav;
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    isFav = widget.contact.isFavorite;
    _nameController = TextEditingController(text: widget.contact.name);
    _surnameController = TextEditingController(text: widget.contact.surname);
    _phoneNumberController =
        TextEditingController(text: widget.contact.phoneNumber);
    _emailController = TextEditingController(text: widget.contact.emailAddress);
    _addressController = TextEditingController(text: widget.contact.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _updateContact() {
    widget.onUpdate(Contact.update(
        name: _nameController.text,
        surname: _surnameController.text,
        phoneNumber: _phoneNumberController.text,
        emailAddress: _emailController.text,
        address: _addressController.text,
        isFavorite: isFav));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _updateContact();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
          ],
        ),
      ),
    );
  }
}
