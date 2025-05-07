class ContactModel {
  final String name;
  final String relation;
  final String phone;
  final String? email;
  final bool isPrimary;

  ContactModel({
    required this.name,
    required this.relation,
    required this.phone,
    this.email,
    this.isPrimary = false,
  });
}
