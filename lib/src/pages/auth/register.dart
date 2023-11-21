// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:app_taller/src/services/taller_service.dart';
import 'package:app_taller/src/utilities/vallidaciones.dart';
import 'package:app_taller/src/widgets/textform.dart';
import 'package:flutter/material.dart';

class RegisterUserTaller extends StatelessWidget {
  RegisterUserTaller({super.key});
  final _formKey = GlobalKey<FormState>();
  late String imagePath = '';
  final _nameController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _ciController = TextEditingController();
  final _direccionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de Tecnico'),
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
                child: FormRegisterUserTaller(
                  formKey: _formKey,
                  nameController: _nameController,
                  ciController: _ciController,
                  phoneController: _phoneController,
                  direccionController: _direccionController,
                  imagePath: imagePath,
                  apellidoController: _apellidoController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              )
            ],
          ),
        ));
  }
}

class FormRegisterUserTaller extends StatelessWidget {
  const FormRegisterUserTaller({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController? nameController,
    required TextEditingController? ciController,
    required TextEditingController? phoneController,
    required TextEditingController? direccionController,
    required TextEditingController? apellidoController,
    required TextEditingController? emailController,
    required TextEditingController? passwordController,
    required this.imagePath,
  })  : _formKey = formKey,
        _nameController = nameController,
        _ciController = ciController,
        _phoneController = phoneController,
        _direccionController = direccionController,
        _apellidoController = apellidoController,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController? _nameController;
  final TextEditingController? _ciController;
  final TextEditingController? _phoneController;
  final TextEditingController? _direccionController;
  final TextEditingController? _apellidoController;
  final TextEditingController? _emailController;
  final TextEditingController? _passwordController;
  final String imagePath;

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
                const Icon(Icons.badge_rounded),
                "Nombre",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba el nombre por favor";
              return null;
            }),
            CustomTextFormField(
                _apellidoController!,
                const Icon(Icons.person_pin_circle_rounded),
                "Apellidos",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba sus apellidos por favor";
              return null;
            }),
            CustomTextFormField(
                _ciController!,
                const Icon(Icons.card_membership),
                "CI",
                TextInputType.phone, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su ci por favor";
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
                "Direccion",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su direccion por favor";
              return null;
            }),
            CustomTextFormField(
                _emailController!,
                const Icon(Icons.mail_rounded),
                "Correo",
                TextInputType.emailAddress,
                validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su correo por favor";
              return null;
            }),
            CustomTextFormField(
                _passwordController!,
                hideText: true,
                const Icon(Icons.password_rounded),
                "Password",
                TextInputType.text, validateTextFormField: (String value) {
              if (value.isEmpty) return "Escriba su password por favor";
              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                bool resp = await tallerService.registrarUsuarioTaller(
                    _nameController!.text,
                    _apellidoController!.text,
                    _phoneController!.text,
                    _direccionController!.text,
                    _ciController!.text,
                    _emailController!.text,
                    _passwordController!.text);
                if (resp) {
                   Future.microtask(() {
                    Navigator.pushNamed(context, "login");
                  });
                }else{
                  print('Algo salio mal!!!');
                }   
              },
              child: const Text(
                'Registrarme',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
