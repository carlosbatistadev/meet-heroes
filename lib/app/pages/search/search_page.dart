import 'package:flutter/material.dart';
import 'search_getx_controller.dart';

class SearchPage extends StatelessWidget {
  final SearchGetxController _controller;

  const SearchPage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(),
    );
  }
}
