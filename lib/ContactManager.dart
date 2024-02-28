import 'Contact.dart';

class ContactManager {
  static final ContactManager _instance = ContactManager._internal();
  factory ContactManager() => _instance;

  ContactManager._internal() {
    _contacts.addAll([
      Contact(
        name: 'Arian',
        surname: 'Berisha',
        phoneNumber: '072222333',
        emailAddress: 'Arian.Berisha@gmail.com',
        address: 'shkup ewq2',
      ),
      Contact.update(
        name: 'Babi',
        surname: '',
        phoneNumber: '07122332211',
        emailAddress: 'fs@gmail.com',
        address: 'shkup',
        isFavorite: true,
      ),
      Contact(
        name: 'Endrit',
        surname: 'Ambari',
        phoneNumber: '072299333',
        emailAddress: 'Endrit.Etemi@gmail.com',
        address: 'kervoc st43',
      ),
      Contact.update(
        name: 'Engjell',
        surname: 'Vlashi',
        phoneNumber: 'Veleshte',
        emailAddress: 'Engjell.Vlashi@gmail.com',
        address: 'velesht strug 23 s323',
        isFavorite: true,
      ),
      Contact(
        name: 'Harbin',
        surname: '',
        phoneNumber: '071102333',
        emailAddress: 'Harbin.S@gmail.com',
        address: 'Diber st213',
      ),
      Contact(
        name: 'Kujtim',
        surname: 'Saliu',
        phoneNumber: '070-111-222',
        emailAddress: 'kujtimsaliu011@gmail.com',
        address: 'shkup dsa21qa',
      ),
      Contact.update(
        name: 'Lavdrim',
        surname: '',
        phoneNumber: '072331122',
        emailAddress: 'Lavdrim.S@gmail.com',
        address: 'shkup dsadssa',
        isFavorite: true,
      ),
    ]);
  }

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  List<Contact> getFavoriteContacts() {
    return _contacts.where((contact) => contact.isFavorite).toList();
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    _contacts.sort((a, b) => a.name.compareTo(b.name));
  }
}
