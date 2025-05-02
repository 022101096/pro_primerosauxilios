import 'package:flutter/material.dart';

class AtragantamientoPage extends StatelessWidget {
  const AtragantamientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atragantamiento'),
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
          _sectionTitle('Signos de Atragantamiento'),
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
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning, color: Colors.red),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Actúa rápidamente si alguien no puede respirar.',
              style: TextStyle(color: Colors.red),
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
        _listItem('Preguntar "¿Estás atragantado?" y animar a toser.'),
        _listItem('Si no puede hablar, aplicar 5 golpes en la espalda.'),
        _listItem(
          'Realizar 5 compresiones abdominales (maniobra de Heimlich).',
        ),
        _listItem(
          'Repetir hasta que se expulse el objeto o llegue ayuda médica.',
        ),
      ],
    );
  }

  Widget _signsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Incapacidad para hablar o respirar.'),
        _listItem('Toser débilmente o no toser.'),
        _listItem('Color azul en labios o rostro.'),
        _listItem('Gestos de llevarse las manos al cuello.'),
      ],
    );
  }

  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem(
          'Nunca dar palmadas en la espalda si la persona puede toser.',
        ),
        _listItem(
          'No realizar maniobras bruscas si la persona está embarazada o es obesa.',
        ),
        _listItem(
          'En bebés, usar golpes suaves en la espalda y compresiones torácicas.',
        ),
      ],
    );
  }

  static Widget _listItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
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
