import 'package:app_taller/src/interfaces/response_login.dart';
import 'package:app_taller/src/interfaces/response_taller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TallerService {
  final baseUrl = 'http://149.50.133.183/public/api';
  TallerService();
  Future<ResponseTaller> getMyTaller() async {
    final prefs = await SharedPreferences.getInstance();
    final usuario = prefs.getString('user');
    final user = userLoginFromJson(usuario!);
    final url = Uri.parse('$baseUrl/get-my-taller/${user.id}');
    try {
      final res = await http.get(url);
      return responseTallerFromJson(res.body);
    } catch (e) {
      return responseTallerFromJson(e.toString());
    }
  }

  Future<bool> registrarTaller(
      String nombre, String telefono, String direccion, String nit) async {
    final prefs = await SharedPreferences.getInstance();
    final usuario = prefs.getString('user');
    final user = userLoginFromJson(usuario!);
    final url = Uri.parse('$baseUrl/register-taller-mecanico');
    try {
      final res = await http.post(url, headers: {
        'Accept': 'application/json'
      }, body: {
        'nombre': nombre,
        'telefono': telefono,
        'direccion': direccion,
        'nit': nit,
        'user_id': user.id.toString()
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
  Future<bool> registrarUsuarioTaller(String nombre, 
                                String apellido, 
                                String telefono,
                                String direccion,
                                String ci, 
                                String email, 
                                String password) async {
    final url = Uri.parse('$baseUrl/register-usuario-taller');
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
        'password': password,
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
}
