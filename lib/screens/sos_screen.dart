import 'package:flutter/material.dart';
import '../widgets/emergency_button.dart';

class SosScreen extends StatelessWidget {
  static const routeName = '/sos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS Emergencia')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text('Ubicación actual:'),
                subtitle: const Text(
                  'Av. Insurgentes Sur 1602, Ciudad de México',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Contactos de Emergencia:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text('Ana García'),
                    subtitle: const Text('Familiar'),
                    trailing: Checkbox(value: true, onChanged: (value) {}),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text('Carlos Rodríguez'),
                    subtitle: const Text('Médico'),
                    trailing: Checkbox(value: false, onChanged: (value) {}),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text('María López'),
                    subtitle: const Text('Contacto de emergencia'),
                    trailing: Checkbox(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: 20),
                  EmergencyButton(onPressed: () {}),
                  const SizedBox(height: 20),
                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Mensaje de Emergencia',
                      border: OutlineInputBorder(),
                      hintText: '¡EMERGENCIA! Necesito ayuda urgente...',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
