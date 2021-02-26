import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meet_heroes/app/shared/widgets/character_detail.dart';

import '../../app_routes.dart';
import 'home_getx_controller.dart';

class HomePage extends StatelessWidget {
  final _controller;

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
                          Get.toNamed(
                            AppRoutes.DETAIL_ROUTE,
                            arguments: _controller.characters[characterID],
                          );
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
