import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HospitalesCercanosScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HospitalesCercanosScreen extends StatelessWidget {
  const HospitalesCercanosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC62828),
        title: const Text(
          'Hospitales Cercanos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar hospitales',
                prefixIcon: const Icon(Icons.search, color: Color(0xFFC62828)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF4FC3F7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFB3E5FC)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                FilterChip(
                  label: const Text(
                    "Todos",
                    style: TextStyle(color: Color(0xFFB71C1C)),
                  ),
                  selected: true,
                  backgroundColor: Color(0xFFE1F5FE),
                  selectedColor: Color(0xFFE1F5FE),
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  avatar: const Icon(
                    Icons.local_hospital,
                    size: 18,
                    color: Color(0xFFC62828),
                  ),
                  label: const Text(
                    "Emergencias 24h",
                    style: TextStyle(color: Color(0xFFB71C1C)),
                  ),
                  selected: false,
                  backgroundColor: Color(0xFFE1F5FE),
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text(
                    "Pediatría",
                    style: TextStyle(color: Color(0xFFB71C1C)),
                  ),
                  selected: false,
                  backgroundColor: Color(0xFFE1F5FE),
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset('assets/maps.jpg'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hospitales Cercanos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB71C1C),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                HospitalCard(
                  name: "Hospital General San José",
                  distance: "0.8 km",
                  address: "Av. Principal 123, Centro Médico",
                  rating: 4.5,
                  open: true,
                ),
                HospitalCard(
                  name: "Clínica Santa Rosa",
                  distance: "1.2 km",
                  address: "Calle Salud 456, Zona Hospitalaria",
                  rating: 4.8,
                  open: true,
                ),
                HospitalCard(
                  name: "Hospital Universitario",
                  distance: "2.1 km",
                  address: "Av. Universidad 789, Campus Médico",
                  rating: 4.3,
                  open: false,
                ),
                HospitalCard(
                  name: "Centro Médico Nacional",
                  distance: "2.5 km",
                  address: "Blvd. de la Salud 321, Zona Norte",
                  rating: 4.7,
                  open: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFC62828),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Citas",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String distance;
  final String address;
  final double rating;
  final bool open;

  const HospitalCard({
    super.key,
    required this.name,
    required this.distance,
    required this.address,
    required this.rating,
    required this.open,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => HospitalDetailScreen(
                  name: name,
                  address: address,
                  rating: rating,
                  open: open,
                  distance: distance,
                ),
          ),
        );
      },
      child: Card(
        color: Color(0xFFE1F5FE),
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/hospital_places.jpg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB71C1C),
                      ),
                    ),
                    Text(
                      address,
                      style: const TextStyle(color: Color(0xFFB71C1C)),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Color(0xFFC62828)),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(color: Color(0xFFB71C1C)),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '• $distance',
                          style: const TextStyle(color: Color(0xFFB71C1C)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      open ? "Abierto ahora" : "Cerrado",
                      style: TextStyle(
                        color: open ? Color(0xFF388E3C) : Color(0xFFC62828),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone, color: Colors.white),
                    label: const Text(
                      'Llamar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4FC3F7),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ComoLlegarScreen(hospitalName: name),
                        ),
                      );
                    },
                    child: const Text(
                      "Cómo llegar",
                      style: TextStyle(color: Color(0xFFB71C1C)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HospitalDetailScreen extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final bool open;
  final String distance;

  const HospitalDetailScreen({
    super.key,
    required this.name,
    required this.address,
    required this.rating,
    required this.open,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC62828),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles del Hospital',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB71C1C),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Dirección: $address',
              style: const TextStyle(color: Color(0xFFB71C1C)),
            ),
            Text(
              'Distancia: $distance',
              style: const TextStyle(color: Color(0xFFB71C1C)),
            ),
            Text(
              'Calificación: $rating',
              style: const TextStyle(color: Color(0xFFB71C1C)),
            ),
            Text(
              open ? 'Estado: Abierto' : 'Estado: Cerrado',
              style: TextStyle(
                color: open ? Color(0xFF388E3C) : Color(0xFFC62828),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/maps.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComoLlegarScreen extends StatelessWidget {
  final String hospitalName;

  const ComoLlegarScreen({super.key, required this.hospitalName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC62828),
        title: Text(
          'Cómo llegar a $hospitalName',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ruta al hospital:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB71C1C),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/maps.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Imagen simulada de ruta en el mapa',
              style: TextStyle(color: Color(0xFFB71C1C)),
            ),
          ],
        ),
      ),
    );
  }
}
