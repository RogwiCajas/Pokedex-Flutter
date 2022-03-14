import 'package:get/get.dart';
import 'package:pokedex/src/data/models/pokemon.model.dart';
import 'package:pokedex/src/data/providers/remote/pokemon.service.dart';

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
