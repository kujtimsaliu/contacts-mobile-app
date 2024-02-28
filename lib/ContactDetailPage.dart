import 'package:flutter/material.dart';
import 'Contact.dart';
import 'package:intl/intl.dart';

class ContactDetailPage extends StatefulWidget {
  final Contact contact;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ContactDetailPage({
    Key? key,
    required this.contact,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  late bool isFavorite;
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.contact.isFavorite;
    _nameController = TextEditingController(text: widget.contact.name);
    _numberController = TextEditingController(text: widget.contact.phoneNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.contact.isFavorite = isFavorite;
    });
  }

  void _editContact() {
    widget.onEdit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: _toggleFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editContact,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.green,
            child: Text(
              widget.contact.name[0],
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${widget.contact.name} ${widget.contact.surname}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(
              thickness: 1, indent: 50, endIndent: 50), // This is the thin line
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(Icons.call, 'Call'),
              _buildActionButton(Icons.message, 'Text'),
              _buildActionButton(Icons.video_call, 'Set up'),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              title: Text(widget.contact.phoneNumber),
              subtitle: const Text('Mobile'),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Added: ${DateFormat('MMM d, yyyy').format(widget.contact.contactCreated)}',
                // widget.contact.contactCreated.toString(),
                // 'Added Feb 27, 2024 (Device)',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blue),
        Text(label),
      ],
    );
  }
}
