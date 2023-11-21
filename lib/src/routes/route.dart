import 'package:app_taller/src/pages/auth/register.dart';
import 'package:app_taller/src/pages/home_page.dart';
import 'package:app_taller/src/pages/taller/add_taller_page.dart';
import 'package:app_taller/src/pages/taller/my_taller_page.dart';
import 'package:app_taller/src/pages/tecnicos/add_tecnicos_page.dart';
import 'package:app_taller/src/pages/utils/splash_page.dart';
import 'package:flutter/material.dart';
import '../pages/auth/login.dart';

class Routes {
  static const initialRoute = 'splash';
  static final Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) =>const LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'splash': (BuildContext context) =>const SplashPage(),
    'mytaller': (BuildContext context) =>const MyTallerPage(),
    'nuew_taller': (BuildContext context) => RegisterTallerPage(),
    'register': (BuildContext context) => RegisterUserTaller(),
    'register_tecnico': (BuildContext context) => AddTecnicosPage(),
  };
  static final routesName = {
    'login': 'login',
    'home': 'home',
    'splash': 'splash',
    'mytaller': 'mytaller',
    'nuew_taller': 'nuew_taller',
    'register': 'register',
    'register_tecnico': 'register_tecnico',

  };
}