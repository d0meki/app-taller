// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:app_taller/src/services/taller_service.dart';
import 'package:app_taller/src/utilities/vallidaciones.dart';
import 'package:app_taller/src/widgets/textform.dart';
import 'package:flutter/material.dart';

class RegisterTallerPage extends StatelessWidget {
  RegisterTallerPage({super.key});
  final _formKey = GlobalKey<FormState>();
  // late List<DataRecognition> respuesta;
  late String imagePath = '';
  late String fileName = '';
  final _nameController = TextEditingController();
  final _ciController = TextEditingController();
  final _phoneController = TextEditingController();
  final _direccionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    late String imagePath = '';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de Taller'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  child: Center(
                    child: imagePath == ''
                        ? const Column(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: Icon(Icons.add_a_photo),
                              ),
                              Text(
                                'Agregar Foto',
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          )
                        : SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.file(File(imagePath)),
                          ),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormularioRegister(
                  formKey: _formKey,
                  nameController: _nameController,
                  ciController: _ciController,
                  phoneController: _phoneController,
                  direccionController: _direccionController,
                  filename: fileName,
                  imagePath: imagePath,
                ),
              )
            ],
          ),
        ));
  }
}

class FormularioRegister extends StatelessWidget {
  const FormularioRegister({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController? nameController,
    required TextEditingController? ciController,
    required TextEditingController? phoneController,
    required TextEditingController? direccionController,
    required this.imagePath,
    required this.filename,
  })  : _formKey = formKey,
        _nameController = nameController,
        _ciController = ciController,
        _phoneController = phoneController,
        _direccionController = direccionController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController? _nameController;
  final TextEditingController? _ciController;
  final TextEditingController? _phoneController;
  final TextEditingController? _direccionController;
  final String imagePath;
  final String filename;

  @override
  Widget build(BuildContext context) {
    TallerService tallerService = TallerService();
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 50, left: 50, bottom: 10, top: 20),
        child: Column(
          children: [
            CustomTextFormField(
                _nameController!,
                const Icon(Icons.assignment_outlined),
                "Nombre del Taller",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty)
                return "Escriba el nombre del taller por favor";
              return null;
            }),
            CustomTextFormField(
                _ciController!,
                const Icon(Icons.card_membership),
                "Nit",
                TextInputType.phone, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su NIT por favor";
              if (!Validation.soloNumeros(_ciController!.text)) {
                return "Solo se permite números";
              }
              return null;
            }),
            CustomTextFormField(
                _phoneController!,
                const Icon(Icons.phone),
                "Teléfono",
                TextInputType.phone, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su télefono por favor";
              if (!Validation.soloNumeros(_phoneController!.text)) {
                return "Solo se permite números";
              }
              return null;
            }),
            CustomTextFormField(
                _direccionController!,
                const Icon(Icons.directions),
                "Direccion del Taller",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty)
                return "Escriba la direccion del taller por favor";
              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                bool resp = await tallerService.registrarTaller(
                    _nameController!.text,
                    _phoneController!.text,
                    _direccionController!.text,
                    _ciController!.text);
                if (resp) {
                  Future.microtask(() {
                    Navigator.pushNamed(context, "mytaller");
                  });
                } else {
                  print('Algo salio mal!!!');
                }
              },
              child: const Text(
                'Registrar mi Taller',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
