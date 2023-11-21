import 'package:app_taller/src/interfaces/response_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final baseUrl = 'http://149.50.133.183/public/api';
  ResponseLogin? responseLogin;
  AuthServices();

  //getters
  ResponseLogin? get getResponseLogin => responseLogin;

  Future<bool> login(email, password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final res = await http.post(url,
          headers: {'Accept': 'application/json'},
          body: {'email': email, 'password': password});
      responseLogin = responseLoginFromJson(res.body);
      if (responseLogin!.success == true) {
        //TODO: debemos verificar que el usuario tenga el rol de taller
        String userLoginJson = jsonEncode(responseLogin!.userLogin);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', userLoginJson);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final usuario = prefs.getString('user');
      if (usuario != null) {
        await prefs.remove('user');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<UsuerLogin> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioString = prefs.getString('user');
    UsuerLogin usuario = userLoginFromJson(usuarioString!);
    return usuario;
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
