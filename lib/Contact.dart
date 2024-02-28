class Contact {
  String name;
  String surname;
  String phoneNumber;
  String emailAddress;
  String address;
  bool isFavorite = false;
  DateTime contactCreated = DateTime.now();
  Contact(
      {required this.name,
      required this.surname,
      required this.phoneNumber,
      required this.emailAddress,
      required this.address})
      : contactCreated = DateTime.now();

  Contact.update({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.emailAddress,
    required this.address,
    required this.isFavorite,
    DateTime? contactCreated,
  }) : this.contactCreated = contactCreated ?? DateTime.now();

  void _addToFavorite() {
    isFavorite = true;
  }
}
