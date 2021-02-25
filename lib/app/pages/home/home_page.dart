import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';
import 'package:meet_heroes/app/shared/widgets/character_detail.dart';

import 'home_getx_controller.dart';

class HomePage extends StatelessWidget {
  final HomeGetxController _controller;

  const HomePage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conhecer Heróis'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: FALTA IMPLEMENTAR
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              height: 400,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) {
                      if (index == 5) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 390,
                            child: Center(
                              child: Text('Mostrar todos'),
                            ),
                          ),
                        );
                      }

                      return characterDetail(
                          CharacterModel.fromMap(
                            {
                              "response": "success",
                              "id": "405",
                              "name": "Lex Luthor",
                              "powerstats": {
                                "intelligence": "100",
                                "strength": "53",
                                "speed": "25",
                                "durability": "65",
                                "power": "68",
                                "combat": "70"
                              },
                              "biography": {
                                "full-name": "Lex Luthor",
                                "alter-egos": "No alter egos found.",
                                "aliases": ["-"],
                                "place-of-birth": "-",
                                "first-appearance": "Action Comics #23",
                                "publisher": "DC Comics",
                                "alignment": "bad"
                              },
                              "appearance": {
                                "gender": "Male",
                                "race": "Human",
                                "height": ["6'2'", "188 cm"],
                                "weight": ["210 lb", "95 kg"],
                                "eye-color": "Green",
                                "hair-color": "No Hair"
                              },
                              "work": {
                                "occupation": "Owner of LexCorp",
                                "base": "-"
                              },
                              "connections": {
                                "group-affiliation":
                                    "Injustice Gang, Injustice League, Society of Supervillains",
                                "relatives":
                                    "Casey and Elaine Griggs (foster parents, deceased),\nLena Luthor (sister pre-Crisis; daughter post-Crisis),\nElizabeth Perske (ex-wife),\nPerry J. White Jr. (son, deceased),\nContessa Erica Alexandra del Portenza (wife, assumed deceased)"
                              },
                              "image": {
                                "url":
                                    "https:\/\/www.superherodb.com\/pictures2\/portraits\/10\/100\/727.jpg"
                              }
                            },
                          ),
                          onTap: () {});
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: Get.width * 0.9,
              child: characterDetail(
                CharacterModel.fromMap(
                  {
                    "response": "success",
                    "id": "405",
                    "name": "Lex Luthor",
                    "powerstats": {
                      "intelligence": "100",
                      "strength": "53",
                      "speed": "25",
                      "durability": "65",
                      "power": "68",
                      "combat": "70"
                    },
                    "biography": {
                      "full-name": "Lex Luthor",
                      "alter-egos": "No alter egos found.",
                      "aliases": ["-"],
                      "place-of-birth": "-",
                      "first-appearance": "Action Comics #23",
                      "publisher": "DC Comics",
                      "alignment": "bad"
                    },
                    "appearance": {
                      "gender": "Male",
                      "race": "Human",
                      "height": ["6'2'", "188 cm"],
                      "weight": ["210 lb", "95 kg"],
                      "eye-color": "Green",
                      "hair-color": "No Hair"
                    },
                    "work": {"occupation": "Owner of LexCorp", "base": "-"},
                    "connections": {
                      "group-affiliation":
                          "Injustice Gang, Injustice League, Society of Supervillains",
                      "relatives":
                          "Casey and Elaine Griggs (foster parents, deceased),\nLena Luthor (sister pre-Crisis; daughter post-Crisis),\nElizabeth Perske (ex-wife),\nPerry J. White Jr. (son, deceased),\nContessa Erica Alexandra del Portenza (wife, assumed deceased)"
                    },
                    "image": {
                      "url":
                          "https:\/\/www.superherodb.com\/pictures2\/portraits\/10\/100\/727.jpg"
                    }
                  },
                ),
                widthInfinity: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
