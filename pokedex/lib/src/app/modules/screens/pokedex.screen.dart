import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/src/app/modules/controllers/pokemon.controller.dart';
import 'package:pokedex/src/app/global/widgets/custom_card.dart';

//externos

class Pokedex extends GetView<PokemonController> {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controlador
    //final controlador = Get.put(PokemonController());

    void _onsubmit(String value) {
      controller.getPokemon(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar por Nombre"),
        backgroundColor: Colors.redAccent,
      ),
      //navigation
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Buscar un pokemón por su nombre:',
                    hintText: 'ejemplo: pikachu',
                    icon: ImageIcon(
                      AssetImage("assets/images/pokemon.png"),
                      color: Colors.redAccent,
                      size: 40,
                    )),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                //onChanged: _onChange,
                onSubmitted: _onsubmit,
              ),
              const Divider(),
              GetBuilder<PokemonController>(builder: (_) {
                if (_.pokemones.isNotEmpty) {
                  return CustomCard(pokemon: _.pokemones[0]);
                } else {
                  return const Text("cargando pokemon..");
                }
              }),
              /*Column(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Types()));
                      },
                      child: const Text("siguiente")),
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
