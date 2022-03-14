//dependencias
import 'package:flutter/material.dart';
import 'package:pokedex/src/app/modules/screens/generacion.screen.dart';
import 'package:pokedex/src/app/modules/screens/home.screen.dart';
import 'package:get/get.dart';
import 'package:pokedex/src/app/modules/screens/pokedex.screen.dart';
import 'package:pokedex/src/app/modules/screens/tipos.screen.dart';
import 'package:pokedex/src/core/routes/routes.dart';
import 'package:pokedex/src/data/providers/remote/pokemon.service.dart';
import 'package:pokedex/src/data/repository/data_binding.dart';

void main() {
  Get.lazyPut(() => PokemonProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex-Rogwi',
      home: const HomePage(),
      getPages: Routes.routes,
      //theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
    );
  }
}
