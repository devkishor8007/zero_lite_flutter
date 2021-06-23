import 'package:flutter/material.dart';

Widget makeText(
  String textString, {
  Color color,
  FontWeight fontWeight,
  double size,
}) {
  return Text(
    textString,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    ),
  );
}
