import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon.controller.dart';
import 'package:pokedex/screens/tipos.screen.dart';

//externos

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controlador
    final controlador = Get.put(PokemonController());

    void _onsubmit(String value) {
      controlador.getPokemon(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("POKEDÉX"),
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
              GetBuilder<PokemonController>(
                  builder: (_) => Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Image.network(
                                    _.pokemones[0].sprite.other.dream.url),
                              ),

                              title: Text(_.pokemones[0].name),
                              subtitle: Text(
                                  "# ${_.pokemones[0].id.toString()} - exp. base ${_.pokemones[0].baseXp.toString()}"),
                              // Text(snapshot.data!.baseXp.toString()),
                            )
                          ],
                        ),
                      )),
              Column(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
