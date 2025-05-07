import 'package:flutter/material.dart';

class DialPad extends StatefulWidget {
  const DialPad({super.key});

  @override
  State<DialPad> createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  String _currentNumber = '';

  void _appendNumber(String digit) {
    setState(() {
      _currentNumber += digit;
    });
  }

  void _callNumber() {
    if (_currentNumber.isNotEmpty) {
      // Implementar llamada
      print('Llamando a $_currentNumber');
      // Limpiar después de llamar
      setState(() {
        _currentNumber = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentNumber.isEmpty ? 'Marcar número' : _currentNumber,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            _DialButton(
              number: '1',
              letters: 'ABC DEF',
              onPressed: _appendNumber,
            ),
            _DialButton(
              number: '2',
              letters: 'GHI JKL',
              onPressed: _appendNumber,
            ),
            _DialButton(number: '3', letters: 'MNO', onPressed: _appendNumber),
            _DialButton(number: '4', letters: 'PQRS', onPressed: _appendNumber),
            _DialButton(number: '5', letters: 'TUV', onPressed: _appendNumber),
            _DialButton(number: '6', letters: 'WXYZ', onPressed: _appendNumber),
            _DialButton(number: '7', letters: '', onPressed: _appendNumber),
            _DialButton(number: '8', letters: '', onPressed: _appendNumber),
            _DialButton(number: '9', letters: '', onPressed: _appendNumber),
            _DialButton(number: '*', letters: '', onPressed: _appendNumber),
            _DialButton(number: '0', letters: '+', onPressed: _appendNumber),
            _DialButton(number: '#', letters: '', onPressed: _appendNumber),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _callNumber,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: const Icon(Icons.call, size: 30),
        ),
      ],
    );
  }
}

class _DialButton extends StatelessWidget {
  final String number;
  final String letters;
  final Function(String) onPressed;

  const _DialButton({
    required this.number,
    required this.letters,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(number),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number, style: const TextStyle(fontSize: 24)),
          if (letters.isNotEmpty)
            Text(letters, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
