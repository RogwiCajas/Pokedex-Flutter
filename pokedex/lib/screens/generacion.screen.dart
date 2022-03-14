//segunda pantalla
import 'package:flutter/material.dart';

class Generation extends StatelessWidget {
  const Generation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generacion"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Volver!'),
        ),
      ),
    );
  }
}
