import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Pokemon.dart';

/**
 * Author: RogwiCajas
 */
//Consumo http
Future<Pokemon> fetchPokemon(String name) async{
  String url = "https://pokeapi.co/api/v2/pokemon/" + name;
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    //si el server responde con 200 ok
    //parseo el objeto json a objeto pokemon
    return Pokemon.fromJson(jsonDecode(response.body));
  }else {
    //si el server no devuelve 200ok
    throw Exception("Fallo al cargar pokemon!!");
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> {
  //variable future, almacena el objeto llamado por http
  late Future<Pokemon> futurePokemon;
  //llamado al servicio al cargar la pantalla
  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon("pikachu");
  }
  //estados
  String _pokemon = "pikachu";
  //setState
  void _onSubmit(String value){
    setState(() => _pokemon = 'submit: $value');
    futurePokemon = fetchPokemon(value);
  }
  //////////////////////////////////////
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title:  const Text("POKEDÉX"),
        backgroundColor: Colors.redAccent,
      ),

      body: Container(
        padding:  const EdgeInsets.all(20.0),
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
                  )
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                //onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              Text(_pokemon),
              //FUTURE BUILDER SIRVE PARA RENDERIZAR DATA DE FETCHS
              FutureBuilder<Pokemon>(
                  future: futurePokemon,
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                             ListTile(
                              leading: Text("Pokemón \nEscogido"),
                              title: Text(snapshot.data!.name),
                              subtitle: Text("# ${snapshot.data!.id.toString()} - exp. base ${snapshot.data!.baseXp.toString()}"),
                              // Text(snapshot.data!.baseXp.toString()),
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Pokemon inválido');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
