import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:meet_heroes/app/app_routes.dart';
import 'package:meet_heroes/app/pages/favorites/favorites_getx_controller.dart';
import 'package:meet_heroes/app/shared/widgets/character_detail.dart';

class FavoritesPage extends StatelessWidget {
  final _controller;

  const FavoritesPage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Hero',
            fontSize: 35,
          ),
        ),
        actions: [
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
            GetBuilder<FavoritesGetxController>(
              builder: (_) {
                if (_controller.isLoading && _controller.favorites.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: List.generate(
                    _controller.favorites.length,
                    (characterID) {
                      return Container(
                        width: Get.width * 0.9,
                        child: characterDetail(
                          _controller.favorites[characterID],
                          widthInfinity: true,
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.DETAIL_ROUTE,
                              arguments: _controller.favorites[characterID],
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
