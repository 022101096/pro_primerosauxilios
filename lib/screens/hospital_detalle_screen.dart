import 'package:flutter/material.dart';

class HospitalDetalleScreen extends StatelessWidget {
  final String nombre;
  final String direccion;
  final String imagen;

  const HospitalDetalleScreen({
    super.key,
    required this.nombre,
    required this.direccion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        title: Text(nombre, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(imagen, fit: BoxFit.cover, height: 200),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              direccion,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF424242), // Gris oscuro para buena lectura
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(
        0xFFB3E5FC,
      ), // Fondo suave para armonía visual
    );
  }
}
