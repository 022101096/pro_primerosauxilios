import 'package:flutter/material.dart';

class HemorragiasPage extends StatelessWidget {
  const HemorragiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hemorragias'),
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
          _sectionTitle('Tipos de Hemorragias'),
          _typesSection(),
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
              'Controlar la hemorragia rápidamente puede salvar vidas.',
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
        _listItem(
          'Aplicar presión directa sobre la herida con un paño limpio.',
        ),
        _listItem('Mantener la presión durante varios minutos.'),
        _listItem('Elevar la zona afectada si es posible.'),
        _listItem('No retirar objetos incrustados; estabilizar alrededor.'),
        _listItem('Buscar atención médica inmediata.'),
      ],
    );
  }

  Widget _typesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Hemorragia externa: Sangrado visible fuera del cuerpo.'),
        _listItem(
          'Hemorragia interna: Sangrado dentro del cuerpo, difícil de detectar.',
        ),
        _listItem(
          'Hemorragia nasal: Sangrado por la nariz, aplicar presión y cabeza inclinada hacia adelante.',
        ),
      ],
    );
  }

  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listItem('Usar guantes si es posible para evitar infecciones.'),
        _listItem('No aplicar torniquetes salvo en situaciones extremas.'),
        _listItem('Mantener a la persona calmada y abrigada.'),
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
