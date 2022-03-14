import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedéx'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () => Get.toNamed('byname'),
                child: const Text('Buscar por nombre')),
            const Divider(),
            ElevatedButton(
                onPressed: () => Get.toNamed('bytype'),
                child: const Text('Buscar por Tipo')),
            const Divider(),
            ElevatedButton(
                onPressed: () => Get.toNamed('bygen'),
                child: const Text('Buscar por generacion')),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
