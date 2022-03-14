//segunda pantalla
import 'package:flutter/material.dart';

class Types extends StatelessWidget {
  const Types({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          const Text("Vista no implementada"),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver!'),
            ),
          ),
        ],
      ),
    );
  }
}
