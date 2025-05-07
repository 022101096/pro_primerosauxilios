import 'package:flutter/material.dart';
// Importamos la pantalla de hospitales

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_hospital, color: Colors.red),
            SizedBox(width: 8),
            Text(
              'Primeros Auxilios',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón de emergencia
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Emergencia: Llamar 106',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Cuadrícula de botones
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 2,
              children: [
                _buildCard(
                  context,
                  'Guía de Primeros Auxilios',
                  'Instrucciones paso a paso',
                  Icons.medical_services,
                  onTap: () {},
                ),
                _buildCard(
                  context,
                  'Hospitales Cercanos',
                  'Encuentra atención médica',
                  Icons.local_hospital,
                  onTap: () {
                    Navigator.pushNamed(context, '/hospitales');
                  },
                ),
                _buildCard(
                  context,
                  'Contactos de Emergencia',
                  'Números importantes',
                  Icons.contacts,
                  onTap: () {},
                ),
                _buildCard(
                  context,
                  'Aprende RCP',
                  'Técnicas básicas',
                  Icons.favorite,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.blue, size: 28),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
