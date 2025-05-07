import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;

  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(contact.name),
      subtitle: Text(contact.relation),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
