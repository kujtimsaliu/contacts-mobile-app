// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'contact.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//   List<Contact> contacts = List.empty(growable: true);

//   int selectedIndex = -1; //nothing selected

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(centerTitle: true, title: const Text('Contact List')),
//         body: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                     hintText: 'Contact Name',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)))),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: contactController,
//                 keyboardType: TextInputType.number,
//                 maxLength: 12,
//                 decoration: const InputDecoration(
//                     hintText: 'Contact Number',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)))),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () {
//                         String name = nameController.text.trim();
//                         String contact = contactController.text.trim();
//                         if (name.isNotEmpty && contact.isNotEmpty) {
//                           setState(() {
//                             nameController.text = '';
//                             contactController.text = '';
//                             contacts
//                                 .add(Contact(name: name, phoneNumber: contact));
//                           });
//                         }
//                       },
//                       child: const Text('Save')),
//                   ElevatedButton(
//                       onPressed: () {
//                         String name = nameController.text.trim();
//                         String contact = contactController.text.trim();
//                         if (name.isNotEmpty && contact.isNotEmpty) {
//                           setState(() {
//                             nameController.text = '';
//                             contactController.text = '';
//                             contacts[selectedIndex].name = name;
//                             contacts[selectedIndex].phoneNumber = contact;
//                             selectedIndex = -1;
//                           });
//                         }
//                       },
//                       child: const Text('Update'))
//                 ],
//               ),
//               const SizedBox(height: 20),
//               contacts.isEmpty
//                   ? const Text('No Contact yet ...',
//                       style: TextStyle(fontSize: 20.0))
//                   : Expanded(
//                       child: ListView.builder(
//                         itemCount: contacts.length,
//                         itemBuilder: (context, index) => getRow(index),
//                       ),
//                     )
//             ],
//           ),
//         ));
//   }

//   Widget getRow(int index) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: index % 2 == 0 ? Colors.deepPurple : Colors.purple,
//           foregroundColor: Colors.white,
//           child: Text(contacts[index].name[0],
//               style: const TextStyle(fontWeight: FontWeight.bold)),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(contacts[index].name,
//                 style: const TextStyle(fontWeight: FontWeight.bold)),
//             Text(contacts[index].phoneNumber)
//           ],
//         ),
//         trailing: SizedBox(
//           width: 70,
//           child: Row(
//             children: [
//               InkWell(
//                   onTap: () {
//                     nameController.text = contacts[index].name;
//                     contactController.text = contacts[index].phoneNumber;
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   },
//                   child: Icon(Icons.edit)),
//               InkWell(
//                   onTap: (() {
//                     setState(() {
//                       contacts.removeAt(index);
//                     });
//                   }),
//                   child: const Icon(Icons.delete))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// // ElevatedButton(
// //               onPressed: () {
// //                 if (_formKey.currentState!.validate()) {
// //                   Contact newContact = Contact(
// //                       name: _nameController.text,
// //                       surname: _surnameController.text,
// //                       phoneNumber: _phoneNumberController.text,
// //                       emailAddress: _emailAddressController.text,
// //                       address: _addressController.text);
// //                   ContactManager().addContact(newContact);
// //                 }
// //                 Navigator.pushReplacement(context, '/contactList');
// //               }

// // i need to go back to the contact list page and display all contacts and the current one i just created. i can also go there by clicking on the Contact List Icon.
// // write the code to have a list of contacts from the ContactManager and display them 