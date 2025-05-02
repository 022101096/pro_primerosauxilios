import 'package:flutter/material.dart';
import 'pages/paro_cardiaco_page.dart';
import 'pages/atragantamiento_page.dart';
import 'pages/quemaduras_page.dart';
import 'pages/hemorragias_page.dart';
import 'pages/fracturas_page.dart';
import 'pages/desmayos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guía de Primeros Auxilios',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
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
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón de emergencia
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                // Aquí puedes integrar una llamada real o alerta
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.call, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Emergencia: Llamar 106',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Cuadrícula de botones
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 2,
                children: [
                  _buildCard(
                    context,
                    'Paro Cardíaco',
                    Icons.favorite,
                    const ParoCardiacoPage(),
                  ),
                  _buildCard(
                    context,
                    'Atragantamiento',
                    Icons.restaurant,
                    const AtragantamientoPage(),
                  ),
                  _buildCard(
                    context,
                    'Quemaduras',
                    Icons.whatshot,
                    const QuemadurasPage(),
                  ),
                  _buildCard(
                    context,
                    'Hemorragias',
                    Icons.bloodtype,
                    const HemorragiasPage(),
                  ),
                  _buildCard(
                    context,
                    'Fracturas',
                    Icons.accessibility_new,
                    const FracturasPage(),
                  ),
                  _buildCard(
                    context,
                    'Desmayos',
                    Icons.sentiment_dissatisfied,
                    const DesmayosPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget destinationPage,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.blue, size: 36),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
