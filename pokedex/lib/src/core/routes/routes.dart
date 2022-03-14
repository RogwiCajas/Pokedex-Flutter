import 'package:get/get.dart';
import 'package:pokedex/src/app/modules/screens/generacion.screen.dart';
import 'package:pokedex/src/app/modules/screens/pokedex.screen.dart';
import 'package:pokedex/src/app/modules/screens/tipos.screen.dart';

import '../../data/repository/data_binding.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/byname',
      page: () => const Pokedex(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/bytype',
      page: () => const Types(),
    ),
    GetPage(
      name: '/bygen',
      page: () => const Generation(),
    ),
  ];
}
