import 'package:get/get.dart';
import 'package:pokedex/src/app/modules/controllers/pokemon.controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonController());
  }
}
