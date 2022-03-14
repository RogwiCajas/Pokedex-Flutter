import 'package:get/get.dart';
import '../models/pokemon.model.dart';

class PokemonProvider extends GetConnect {
  @override
  void onInit() {
    print('pokemonprovider init');
  }

  //peticiones
  Future<List<Pokemon>> getPokemon(String name) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/' + name;
    final response = await get(url);
    final lista = <Pokemon>[];
    final pokemon = Pokemon.fromJson(response.body);
    lista.add(pokemon);
    return lista;
  }
}
