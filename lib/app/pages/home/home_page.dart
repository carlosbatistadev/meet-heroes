import 'package:flutter/material.dart';

import 'home_getx_controller.dart';

class HomePage extends StatelessWidget {
  final HomeGetxController _controller;

  const HomePage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis e Vilões'),
      ),
      body: Container(),
    );
  }
}
