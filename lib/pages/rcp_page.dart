import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RCPGuideScreen extends StatefulWidget {
  const RCPGuideScreen({super.key});

  @override
  State<RCPGuideScreen> createState() => _RCPGuideScreenState();
}

class _RCPGuideScreenState extends State<RCPGuideScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/rcp_demo.mp4',
    );
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      aspectRatio: 16 / 9,
      placeholder: Container(
        color: Colors.grey,
        child: const Center(
          child: Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
        ),
      ),
      autoInitialize: true,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Técnicas Básicas de RCP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de emergencia
            Container(
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
                      'En caso de emergencia, llame al 911.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sección Qué es RCP
            const Text(
              '¿Qué es RCP?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'La Reanimación Cardiopulmonar (RCP) es una técnica de emergencia que combina compresiones torácicas con respiración artificial para mantener el flujo de sangre oxigenada al cerebro y otros órganos vitales.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/images/rcp_illustration.png'),
            const SizedBox(height: 24),

            // Divider
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 16),

            // Sección Pasos Básicos
            const Text(
              'Pasos Básicos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),

            // Paso 1
            _buildStepCard(
              title: '1. Verificar la consciencia',
              description:
                  'Compruebe si la persona responde sacudiéndola suavemente y preguntándole en voz alta si se encuentra bien.',
              imagePath: 'assets/images/check_consciousness.jpg',
            ),
            const SizedBox(height: 16),

            // Paso 2
            _buildStepCard(
              title: '2. Llamar a emergencias',
              description:
                  'Si la persona no responde, llame inmediatamente al 911 o pida a alguien que lo haga mientras usted comienza la RCP.',
              imagePath: 'assets/images/call_emergency.jpg',
            ),
            const SizedBox(height: 16),

            // Paso 3
            _buildStepCard(
              title: '3. Compresiones torácicas',
              description:
                  'Coloque el talón de la mano en el centro del pecho, entrelace los dedos y realice compresiones rápidas y firmes (100-120 por minuto).',
              imagePath: 'assets/images/chest_compressions.jpg',
            ),
            const SizedBox(height: 24),

            // Video demostrativo
            const Text(
              'Video Demostrativo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mire este video para ver la técnica correcta de RCP:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _videoPlayerController.value.isInitialized
                ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: _chewieController),
                )
                : Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            const SizedBox(height: 24),

            // Consejos importantes
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consejos importantes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTipItem(
                    'Comprima fuerte y rápido (al menos 5 cm de profundidad)',
                  ),
                  _buildTipItem(
                    'Mantenga un ritmo de 100-120 compresiones por minuto',
                  ),
                  _buildTipItem(
                    'No interrumpa las compresiones más de 10 segundos',
                  ),
                  _buildTipItem(
                    'Si está entrenado, combine con respiraciones de rescate (30:2)',
                  ),
                  _buildTipItem(
                    'Use el ritmo de la canción "Stayin\' Alive" como guía',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Botón de emergencia flotante
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Lógica para llamada de emergencia
              },
              icon: const Icon(Icons.call, color: Colors.white),
              label: const Text(
                'LLAMAR AL 911',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
