import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/shared/models/character_model.dart';
import 'package:meet_heroes/app/shared/widgets/character_detail.dart';

import '../../app_routes.dart';
import 'home_getx_controller.dart';

class HomePage extends StatelessWidget {
  final HomeGetxController _controller;

  const HomePage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heroes',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Hero',
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_sharp),
            onPressed: () {
              // TODO: FALTA IMPLEMENTAR
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed(AppRoutes.SEARCH_ROUTE);
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
                child: GetBuilder<HomeGetxController>(
                  builder: (_) {
                    if (_controller.isLoading &&
                        _controller.favorites.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: List.generate(
                        _controller.favorites.length + 1,
                        (characterID) {
                          if (characterID == _controller.favorites.length) {
                            if (_controller.favorites.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Nada para mostrar',
                                ),
                              );
                            }
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
                            _controller.favorites[characterID],
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            GetBuilder<HomeGetxController>(
              builder: (_) {
                if (_controller.isLoading && _controller.characters.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: List.generate(_controller.characters.length + 1,
                      (characterID) {
                    if (characterID == _controller.characters.length) {
                      if (_controller.characters.isEmpty) {
                        return Text('Nada para mostrar');
                      }
                      return InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                            child: _controller.isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    'Carregar Mais',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        ),
                        onTap: _controller.loadMoreCharacters,
                      );
                    }
                    return Container(
                      width: Get.width * 0.9,
                      child: characterDetail(
                        _controller.characters[characterID],
                        widthInfinity: true,
                        onTap: () {
                          // TODO: FALTA FAZER
                        },
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
