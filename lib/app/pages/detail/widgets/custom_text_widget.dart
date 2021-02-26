import 'package:flutter/material.dart';

Widget customText({String title, String content}) {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text.rich(
      TextSpan(
        text: '$title:',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' $content',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),
  );
}
