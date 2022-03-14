import 'package:get/get.dart';
import 'package:pokedex/services/pokemon.service.dart';

import '../models/pokemon.model.dart';

class PokemonController extends GetxController {
  var pokemones = <Pokemon>[];
  var pokemonProvider = Get.find<PokemonProvider>();

  PokemonController() {
    getPokemon('pikachu');
  }

  Future getPokemon(String name) async {
    final lista = await pokemonProvider.getPokemon(name);
    pokemones.clear();
    pokemones = lista;
    update();
  }
}
