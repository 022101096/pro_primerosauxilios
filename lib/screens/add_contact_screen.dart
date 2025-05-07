import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddContactScreen extends StatefulWidget {
  static const routeName = '/add-contact';

  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoController = TextEditingController();
  String _relacion = 'Padre/Madre';
  bool _esPrincipal = false;
  File? _imagen;

  final List<String> _relaciones = [
    'Padre/Madre',
    'Hermano/a',
    'Amigo/a',
    'Pareja',
    'Otro',
  ];

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imagen = File(picked.path);
      });
    }
  }

  Future<void> _guardarContacto() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseFirestore.instance.collection('contactos').add({
          'nombre': _nombreController.text,
          'relacion': _relacion,
          'telefono': _telefonoController.text,
          'correo': _correoController.text,
          'esPrincipal': _esPrincipal,
          'creado': Timestamp.now(),
        });
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al guardar: $e')));
      }
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _telefonoController.dispose();
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Contacto'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _guardarContacto),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Esta persona será contactada en caso de emergencia',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Selector de imagen
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _imagen != null ? FileImage(_imagen!) : null,
                  child:
                      _imagen == null
                          ? const Icon(Icons.add_a_photo, size: 40)
                          : null,
                ),
              ),
              const SizedBox(height: 20),

              // Campo Nombre
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 16),

              // Campo Relación
              DropdownButtonFormField<String>(
                value: _relacion,
                decoration: const InputDecoration(
                  labelText: 'Relación',
                  border: OutlineInputBorder(),
                ),
                items:
                    _relaciones.map((rel) {
                      return DropdownMenuItem(value: rel, child: Text(rel));
                    }).toList(),
                onChanged:
                    (value) =>
                        setState(() => _relacion = value ?? 'Padre/Madre'),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Seleccione relación' : null,
              ),
              const SizedBox(height: 16),

              // Campo Teléfono
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Número de Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 16),

              // Campo Correo
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico (opcional)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Checkbox Principal
              SwitchListTile(
                title: const Text('Contacto principal'),
                value: _esPrincipal,
                onChanged: (value) => setState(() => _esPrincipal = value),
              ),
              const SizedBox(height: 24),

              // Botón Guardar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _guardarContacto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'GUARDAR CONTACTO',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
