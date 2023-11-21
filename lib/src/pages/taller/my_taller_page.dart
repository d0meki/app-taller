import 'package:app_taller/src/interfaces/response_taller.dart';
import 'package:app_taller/src/services/taller_service.dart';
import 'package:flutter/material.dart';

class MyTallerPage extends StatelessWidget {
  const MyTallerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tallerService = TallerService();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi Taller'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: const Icon(Icons.home)),
        ),
        body: FutureBuilder(
          future: tallerService.getMyTaller(),
          builder:
              (BuildContext context, AsyncSnapshot<ResponseTaller> snapshot) {
            if (snapshot.hasData) {
              final taller = snapshot.data!.tallerResponse;
              if (taller == null) {
                return Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'nuew_taller');
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Agregar Taller'),
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                        radius: 70,
                        backgroundImage: (taller.foto != null)
                            ? NetworkImage(taller.foto)
                            : const NetworkImage(
                                'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')),
                    const SizedBox(height: 20),
                    Text("Taller: ${taller.nombre!}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Telefono: ${taller.telefono!}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Direccion: ${taller.direccion!}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Nit: ${taller.nit!}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "register_tecnico",
                                arguments: taller.id);
                          },
                          icon: const Icon(Icons.engineering_rounded),
                          label: const Text('Agregar Tecnico'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.map_rounded),
                          label: const Text('Ver en el Mapa'),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Tecnicos',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (taller.tecnicos!.isEmpty)
                      const Center(
                        child: Text(
                          'No hay tecnicos registrados',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (taller.tecnicos!.isNotEmpty)
                      for (var item in taller.tecnicos!)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ListTile(
                            title: Text(
                                "${item.user!.nombre!} ${item.user!.apellido!}"),
                            subtitle: Text(item.user!.telefono!),
                            trailing: IconButton(
                              onPressed: () {
                                print("ver en mapa");
                              },
                              icon: const Icon(Icons.map_rounded),
                            ),
                          ),
                        )
                  ],
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
