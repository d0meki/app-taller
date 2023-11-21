
import 'package:app_taller/firebase_options.dart';
import 'package:app_taller/src/app.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp( const MyApp());
}
