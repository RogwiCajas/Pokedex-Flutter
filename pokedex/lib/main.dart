//dependencias
import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex.screen.dart';
import 'package:get/get.dart';
import 'package:pokedex/services/pokemon.service.dart';

void main() {
  Get.lazyPut(() => PokemonProvider());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: Pokedex(),
      //theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
    );
  }
}
