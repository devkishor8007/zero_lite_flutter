import 'package:flutter/material.dart';
import 'makeText.dart';

Widget elevatedButton(
  context, {
  required String textString,
  Function? onPressed,
  Size? minimumSize,
}) {
  return ElevatedButton(
    onPressed: onPressed as void Function()?,
    child: makeText(
      textString,
      color: Colors.white,
      size: Theme.of(context).textTheme.button!.fontSize,
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.teal,
      minimumSize: minimumSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
