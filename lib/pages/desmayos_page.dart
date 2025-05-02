import 'package:flutter/material.dart';

class DesmayosPage extends StatelessWidget {
  const DesmayosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desmayos'),
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
          _sectionTitle('Causas Comunes'),
          _causesSection(),
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
        color: Colors.yellow.shade50,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Actuar rápidamente puede prevenir complicaciones.',
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
        _listItem('Colocar a la persona acostada boca arriba.'),
        _listItem('Elevar las piernas unos 30 cm si no hay lesiones.'),
        _listItem('Aflojar ropa ajustada.'),
        _listItem('Mantener el ambiente ventilado.'),
        _listItem(
          'Si no recupera la conciencia en 1 minuto, buscar ayuda médica.',
        ),
      ],
    );
  }

  Widget _causesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Bajada repentina de presión arterial.'),
        _listItem('Deshidratación o golpe de calor.'),
        _listItem('Miedo intenso, dolor o estrés emocional.'),
        _listItem('Problemas cardíacos subyacentes.'),
      ],
    );
  }

  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem(
          'No dar de beber líquidos hasta que recupere totalmente la conciencia.',
        ),
        _listItem(
          'No dejar sola a la persona hasta estar seguro de su estado.',
        ),
        _listItem('Consultar a un médico aunque se recupere rápido.'),
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
