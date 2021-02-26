import 'package:flutter/material.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';

Widget characterDetail(CharacterModel character,
    {bool widthInfinity = false, Function() onTap}) {
  return Card(
    color: Colors.brown[50],
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: widthInfinity ? double.infinity : 200,
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Hero(
              tag: character.image.url,
              child: Image.network(
                character.image.url,
                frameBuilder: (BuildContext context, Widget child, int frame,
                    bool wasSynchronouslyLoaded) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: child,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  return Center(child: child);
                },
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    character.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(character.id),
              ],
            ),
            const Divider(),
            powerstats(
              powerName: 'Inteligência',
              quantity: double.tryParse(character.powerstats.intelligence),
            ),
            powerstats(
              powerName: 'Força',
              quantity: double.tryParse(character.powerstats.strength),
            ),
            powerstats(
              powerName: 'Velocidade',
              quantity: double.tryParse(character.powerstats.speed),
            ),
            powerstats(
              powerName: 'Durabilidade',
              quantity: double.tryParse(character.powerstats.durability),
            ),
            powerstats(
              powerName: 'Poder',
              quantity: double.tryParse(character.powerstats.power),
            ),
            powerstats(
              powerName: 'Combate',
              quantity: double.tryParse(character.powerstats.combat),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget powerstats({String powerName, double quantity}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(powerName),
      Container(
        width: 100,
        height: 6,
        color: Colors.red[100],
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: quantity == null ? 0.0 : quantity,
            height: 6,
            color: Colors.red,
          ),
        ),
      ),
    ],
  );
}
