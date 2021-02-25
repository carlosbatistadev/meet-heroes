import 'package:flutter/material.dart';

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
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // TODO: FALTA IMPLEMENTAR
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: FALTA IMPLEMENTAR
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
