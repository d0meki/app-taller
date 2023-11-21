import 'package:http/http.dart' as http;
import 'dart:convert';

class TecnicosService {
  final baseUrl = 'http://149.50.133.183/public/api';
  TecnicosService();

  Future<bool> registrarTecnico(String nombre, 
                                String apellido, 
                                String telefono,
                                String direccion,
                                String ci, 
                                String email, 
                                String tallerId) async {
    final url = Uri.parse('$baseUrl/register-tecnico');
    try {
      final res = await http.post(url, headers: {
        'Accept': 'application/json'
      }, body: {
        'nombre': nombre,
        'apellido': apellido,
        'telefono': telefono,
        'ci': ci,
        'direccion': direccion,
        'email': email,
        'taller_id': tallerId,
      });
      final data = jsonDecode(res.body);
      if (data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  /*  Future<dynamic> registrarUsuario(
      Map<String, dynamic> usuario, imagenPath, fileName) async {
    final url = Uri.parse('$baseUrl/auth/register-user');
    try {
      final res = await http.post(url,
          headers: {'Accept': 'application/json'},
          body: {usuario, imagenPath, fileName});
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> verificarCi(String ci) async {
    final url = Uri.parse('$baseUrl/auth/verificar-ci');
    try {
      final res = await http
          .post(url, headers: {'Accept': 'application/json'}, body: {"ci": ci});
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      return e;
    }
  }

  Future<bool> verificarFoto(String image64, String uuid) async {
    final url = Uri.parse('$baseUrl/auth/verificar-foto');
    try {
      final res = await http.post(url,
          headers: {'Accept': 'application/json'}, body: {image64, uuid});
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> changePassword(String newPassword, user) async {
    final url = Uri.parse('$baseUrl/auth/change-password');
    Map<String, dynamic> respuesta;
    if (newPassword.length < 8 || !containsAlphanumeric(newPassword)) {
      respuesta = {
        "status": false,
        "msg": "Password debe ser alfanumerico y Mayor o igual a o 8 caracteres"
      };
      return respuesta;
    }
    try {
      final res = await http
          .post(url, headers: {'Accept': 'application/json'}, body: {user,newPassword});
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
       respuesta = {
        "status": false,
        "msg": "error"
      };
      return respuesta;
    }
  }

  Future<bool> signOut(user) async {
    final url = Uri.parse('$baseUrl/auth/logout');
    try {
      final res = await http
          .post(url, headers: {'Accept': 'application/json'}, body: {user});
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      return false;
    }
  }

  bool containsAlphanumeric(String password) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumeric.hasMatch(password);
  } */
}
