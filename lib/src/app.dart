import 'package:app_taller/src/routes/route.dart';
// import 'package:fire_base_evento/src/providers/pay_provide.dart';
// import 'package:fire_base_evento/src/routes/route.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'providers/push_notifications_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
