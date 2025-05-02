import 'package:flutter/material.dart';

class QuemadurasPage extends StatelessWidget {
  const QuemadurasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quemaduras'),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _emergencyBanner(),
          const SizedBox(height: 16),
          _sectionTitle('Pasos a Seguir'),
          _stepsSection(),
          const SizedBox(height: 24),
          _sectionTitle('Tipos de Quemaduras'),
          _signsSection(),
          const SizedBox(height: 24),
          _sectionTitle('Consejos'),
          _tipsSection(),
          const SizedBox(height: 24),
          _saveGuideButton(),
        ],
      ),
    );
  }

  Widget _emergencyBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'En caso de quemaduras graves, llama a emergencias.',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _stepsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Alejar a la persona de la fuente de calor.'),
        _listItem('Enfriar la quemadura con agua (no helada) por 10 minutos.'),
        _listItem('Cubrir la quemadura con un paño limpio y húmedo.'),
        _listItem('No reventar ampollas.'),
        _listItem('Buscar atención médica si es necesario.'),
      ],
    );
  }

  Widget _signsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Quemaduras de primer grado: enrojecimiento y dolor.'),
        _listItem('Quemaduras de segundo grado: ampollas y dolor intenso.'),
        _listItem(
          'Quemaduras de tercer grado: piel carbonizada o blanca, sin dolor inicial.',
        ),
      ],
    );
  }

  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('No aplicar hielo directamente.'),
        _listItem('No usar mantequilla, aceite o cremas caseras.'),
        _listItem('Elevar el área quemada si es posible.'),
      ],
    );
  }

  static Widget _listItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 20),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _saveGuideButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.save),
      label: const Text('Guardar Guía'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}
