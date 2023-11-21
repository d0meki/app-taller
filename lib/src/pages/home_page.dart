import 'package:app_taller/src/interfaces/response_login.dart';
import 'package:app_taller/src/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    final authServices = AuthServices();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          leading: IconButton(
              onPressed: () async {
                final respuesta = await authServices.logout();
                if (respuesta) {
                  Future.microtask(() {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'login', (Route<dynamic> route) => false);
                  });
                }
              },
              icon: const Icon(Icons.logout)),
        ),
        body: Center(
          child: FutureBuilder(
              future: authServices.getProfile(),
              builder:
                  (BuildContext context, AsyncSnapshot<UsuerLogin> snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                          radius: 70,
                          backgroundImage: (user.avatar != null)
                              ? NetworkImage(user.avatar!)
                              : const NetworkImage(
                                  'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')),
                      const SizedBox(height: 20),
                      if (user.roles!.isNotEmpty)
                        for (var rol in user.roles!)
                          Text("Rol: [ ${rol.role!.rol} ]",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text("Nombre: ${user.nombre!}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text("Apellido: ${user.apellido!}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text("Email: ${user.email!}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, 'mytaller');
                          },
                          icon: const Icon(Icons.import_export),
                          label: const Text('Mi taller')),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.telegram),
                          label: const Text('tex button icon')),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.telegram),
                          label: const Text('tex button icon')),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.telegram),
                          label: const Text('tex button icon')),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
