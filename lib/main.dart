import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'screens/emergency_contacts_screen.dart';
import 'screens/add_contact_screen.dart';
import 'screens/hospitales_page.dart';
import 'screens/rcp_guide_screen.dart';

// Pages de emergencia
import 'pages/paro_cardiaco_page.dart';
import 'pages/atragantamiento_page.dart';
import 'pages/quemaduras_page.dart';
import 'pages/hemorragias_page.dart';
import 'pages/fracturas_page.dart';
import 'pages/desmayos_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Primer Auxilio',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Color(0xFFB71C1C), // Rojo oscuro para títulos
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Color(0xFFB71C1C),
          ),
          titleLarge: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Color(0xFFB71C1C),
          ),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/contacts': (context) => EmergencyContactsScreen(),
        '/add_contact': (context) => const AddContactScreen(),
        '/hospitals': (context) => const HospitalesCercanosScreen(),
        '/rcp': (context) => RcpGuideScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.medical_services, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'PrimerAuxilio',
              style: TextStyle(fontFamily: 'Merriweather', color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFC62828), // Rojo oscuro
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
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
                backgroundColor: const Color(0xFFEF5350), // Rojo claro
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              onPressed: () {
                // Aquí puedes hacer una integración con marcador telefónico
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.emergency, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'Emergencia: Llamar 106',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Cuadrícula de accesos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildCard(
                    context,
                    'Guía de\nPrimeros Auxilios',
                    Icons.medical_information,
                    const Color(0xFFE1F5FE), // Celeste muy claro 1
                    '/rcp',
                  ),
                  _buildCard(
                    context,
                    'Hospitales\nCercanos',
                    Icons.local_hospital,
                    const Color(0xFFB3E5FC), // Celeste claro 2
                    '/hospitals',
                  ),
                  _buildCard(
                    context,
                    'Contactos de\nEmergencia',
                    Icons.contacts,
                    const Color(0xFF81D4FA), // Celeste medio 3
                    '/contacts',
                  ),
                  _buildCard(
                    context,
                    'Aprende RCP',
                    Icons.heart_broken,
                    const Color(0xFF4FC3F7), // Celeste más intenso 4
                    '/rcp',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Categorías
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categorías de Emergencia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Merriweather',
                  color: Color(0xFFB71C1C), // Rojo oscuro
                ),
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
              children: [
                _categoryButton(
                  context,
                  'Quemaduras',
                  Icons.fireplace,
                  const Color(0xFFE1F5FE), // Celeste muy claro
                  const QuemadurasPage(),
                ),
                _categoryButton(
                  context,
                  'Fractura',
                  Icons.cast_connected,
                  const Color(0xFFE1F5FE),
                  const FracturasPage(),
                ),
                _categoryButton(
                  context,
                  'Heridas',
                  Icons.cut,
                  const Color(0xFFE1F5FE),
                  const HemorragiasPage(),
                ),
                _categoryButton(
                  context,
                  'Asfixia',
                  Icons.air,
                  const Color(0xFFE1F5FE),
                  const AtragantamientoPage(),
                ),
                _categoryButton(
                  context,
                  'Desmayos',
                  Icons.accessible_forward,
                  const Color(0xFFE1F5FE),
                  const DesmayosPage(),
                ),
                _categoryButton(
                  context,
                  'Cardíaco',
                  Icons.monitor_heart,
                  const Color(0xFFE1F5FE),
                  const ParoCardiacoPage(),
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
    IconData icon,
    Color color,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: const Color(0xFFC62828), size: 40), // Rojo
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB71C1C), // Rojo oscuro
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFB3E5FC), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFC62828), size: 32), // Rojo
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB71C1C), // Rojo oscuro
              ),
            ),
          ],
        ),
      ),
    );
  }
}
