import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/data/models/pokemon.model.dart';

class CustomCard extends StatelessWidget {
  final Pokemon pokemon;
  const CustomCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: FadeInImage(
            fit: BoxFit.cover,
            width: 200,
            height: 200,
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(pokemon.sprite.other.dream.url),
          ),
        ),
        Text(pokemon.name),
        Text(
            "# ${pokemon.id.toString()} - exp. base ${pokemon.baseXp.toString()}"),
      ],
    );
  }
}

/*Old card
 /*return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Image.network(pokemon.sprite.other.dream.url),
            ),

            title: Text(pokemon.name),
            subtitle: Text(
                "# ${pokemon.id.toString()} - exp. base ${pokemon.baseXp.toString()}"),
            
            // Text(snapshot.data!.baseXp.toString()),
          )
        ],
      ),
    );*/
 */
