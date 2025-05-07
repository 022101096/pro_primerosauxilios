import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_contact_screen.dart';

class EmergencyContactsScreen extends StatefulWidget {
  static const routeName = '/emergency-contacts';

  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final List<Map<String, String>> contacts = [
    {'name': 'María González', 'phone': '+34 612 345 678', 'relation': 'Madre'},
    {
      'name': 'Dr. Rodriguez',
      'phone': '+34 623 456 789',
      'relation': 'Médico familiar',
    },
    {'name': 'Juan Pérez', 'phone': '+34 634 567 890', 'relation': 'Hermano'},
  ];

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      _showDialog(context, 'Error', 'No se pudo iniciar la llamada.');
    }
  }

  void _sendSMS(String phoneNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      _showDialog(context, 'Error', 'No se pudo abrir la app de mensajes.');
    }
  }

  Widget _buildContactCard({
    required String name,
    required String phone,
    required String relation,
    bool isPrincipal = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      shadowColor: Colors.grey[300],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red[100],
          child: const Icon(Icons.person, color: Colors.black87),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$relation\n$phone'),
        isThreeLine: true,
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.call, color: Color(0xFF4FC3F7)),
              onPressed: () => _makePhoneCall(phone),
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Color(0xFF4FC3F7)),
              onPressed: () => _sendSMS(phone),
            ),
            if (isPrincipal) const Icon(Icons.star, color: Colors.amber),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceButton(
    String label,
    String number,
    Color color,
    IconData icon,
  ) {
    return ElevatedButton(
      onPressed: () => _makePhoneCall(number),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(100, 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de Emergencia'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Servicios de Emergencia',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildServiceButton(
                  'Policía',
                  '105',
                  Colors.blue,
                  Icons.local_police,
                ),
                _buildServiceButton(
                  'Ambulancia',
                  '106',
                  Colors.red,
                  Icons.healing,
                ),
                _buildServiceButton(
                  'Bomberos',
                  '116',
                  Colors.orange,
                  Icons.fireplace,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Contactos Personales de Emergencia',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddContactScreen(),
                    fullscreenDialog: true,
                  ),
                );

                if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contacto agregado exitosamente'),
                    ),
                  );
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                elevation: 3,
                shadowColor: Colors.red[200],
              ),
              icon: const Icon(Icons.add_circle, size: 24),
              label: const Text(
                'AGREGAR NUEVO CONTACTO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...contacts.map(
              (contact) => _buildContactCard(
                name: contact['name']!,
                phone: contact['phone']!,
                relation: contact['relation']!,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance
                        .collection('contactos')
                        .orderBy('creado', descending: true)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data?.docs ?? [];
                  if (docs.isEmpty) {
                    return const Text('No hay contactos agregados aún.');
                  }
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      return _buildContactCard(
                        name: data['nombre'] ?? 'Sin nombre',
                        phone: data['telefono'] ?? 'Sin número',
                        relation: data['relacion'] ?? 'Sin relación',
                        isPrincipal: data['esPrincipal'] == true,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showDialog(
                        context,
                        'Ubicación compartida',
                        'Tu ubicación ha sido enviada.',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.location_on, color: Colors.black),
                    label: const Text(
                      'Compartir Mi Ubicación',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showDialog(
                        context,
                        'SOS enviado',
                        'Tu mensaje de SOS ha sido enviado.',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.warning, color: Colors.black),
                    label: const Text(
                      'Mensaje SOS',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
