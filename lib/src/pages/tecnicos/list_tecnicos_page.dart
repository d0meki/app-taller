import 'package:flutter/material.dart';

class ListTecnicosPage extends StatelessWidget {
  const ListTecnicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tecnicos Page'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('item $index'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}