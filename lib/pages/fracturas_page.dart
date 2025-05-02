import 'package:flutter/material.dart';

class FracturasPage extends StatelessWidget {
  const FracturasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fracturas'),
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
          _sectionTitle('Signos de Fractura'),
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
        color: Colors.blue.shade50,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning, color: Colors.blue),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Inmovilizar correctamente puede evitar más daño.',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _stepsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('No mover el hueso fracturado.'),
        _listItem('Inmovilizar la fractura con férulas o material rígido.'),
        _listItem('Aplicar hielo sobre el área lesionada.'),
        _listItem('Elevar la extremidad si es posible.'),
        _listItem('Buscar atención médica urgente.'),
      ],
    );
  }

  Widget _signsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Dolor intenso en la zona afectada.'),
        _listItem('Hinchazón y deformidad visible.'),
        _listItem('Imposibilidad de mover la extremidad.'),
      ],
    );
  }

  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('No intentar alinear el hueso fracturado.'),
        _listItem('Mantener a la persona calmada.'),
        _listItem('Cubrir heridas abiertas sin presionar la fractura.'),
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
