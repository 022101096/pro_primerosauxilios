import 'package:flutter/material.dart';
import 'emergency_contacts_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Contactos de Emergencia'),
          onPressed: () {
            Navigator.pushNamed(context, EmergencyContactsScreen.routeName);
          },
        ),
      ),
    );
  }
}
