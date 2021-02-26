import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget informationWidget(String _title, List<Widget> _children) {
  return Container(
    width: Get.width * 0.9,
    padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            '$_title',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
        ),
        const Divider(),
        ..._children,
      ],
    ),
  );
}
