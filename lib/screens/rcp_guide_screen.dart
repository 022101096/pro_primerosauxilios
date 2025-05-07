import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RcpGuideScreen extends StatefulWidget {
  static const routeName = '/rcp-guide';

  const RcpGuideScreen({super.key});

  @override
  State<RcpGuideScreen> createState() => _RcpGuideScreenState();
}

class _RcpGuideScreenState extends State<RcpGuideScreen> {
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
        title: const Text(
          'Técnicas Básicas de RCP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFC62828),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFB3E5FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de emergencia
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                border: Border.all(color: const Color(0xFFC62828)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.warning, color: Color(0xFFC62828)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'En caso de emergencia, llame al 911.',
                      style: TextStyle(color: Color(0xFFC62828)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sección ¿Qué es RCP?
            const Text(
              '¿Qué es RCP?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC62828),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'La Reanimación Cardiopulmonar (RCP) es una técnica de emergencia que combina compresiones torácicas con respiración artificial para mantener el flujo de sangre oxigenada al cerebro y otros órganos vitales.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/rcp_illustration.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Pasos de RCP
            const Text(
              'Pasos Básicos de RCP',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC62828),
              ),
            ),
            const SizedBox(height: 16),

            _buildStepCard(
              stepNumber: 1,
              title: 'Verificar la consciencia',
              description:
                  'Compruebe si la persona responde sacudiéndola suavemente y preguntándole en voz alta si se encuentra bien.',
              imagePath: 'assets/images/check_consciousness.jpg',
            ),
            _buildStepCard(
              stepNumber: 2,
              title: 'Llamar a emergencias',
              description:
                  'Si la persona no responde, llame inmediatamente al 911 o pida a alguien que lo haga mientras usted comienza la RCP.',
              imagePath: 'assets/images/call_emergency.jpg',
            ),
            _buildStepCard(
              stepNumber: 3,
              title: 'Compresiones torácicas',
              description:
                  'Coloque el talón de la mano en el centro del pecho, entrelace los dedos y realice compresiones rápidas y firmes (100-120 por minuto).',
              imagePath: 'assets/images/chest_compressions.jpg',
            ),

            // Video demostrativo
            const SizedBox(height: 24),
            const Text(
              'Video Demostrativo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC62828),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child:
                  _videoPlayerController.value.isInitialized
                      ? Chewie(controller: _chewieController)
                      : const Center(child: CircularProgressIndicator()),
            ),

            // Consejos importantes
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFB3E5FC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consejos importantes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4FC3F7),
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
                    'Use el ritmo de la canción "Stayin\' Alive" como guía',
                  ),
                  _buildTipItem(
                    'No interrumpa las compresiones más de 10 segundos',
                  ),
                ],
              ),
            ),

            // Botón de emergencia
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC62828),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Lógica para llamar al 911
                },
                icon: const Icon(Icons.call, color: Colors.white),
                label: const Text(
                  'LLAMAR AL 911',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required int stepNumber,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 180,
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
                  '$stepNumber. $title',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC62828),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF4FC3F7), size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
