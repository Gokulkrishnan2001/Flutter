import 'package:flutter/material.dart';
// ignore: must_be_immutable
class SingButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  SingButtons({
    super.key, required this.onPressed,
    required this.text
    }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      //color: Color.fromRGBO(76, 187, 23, 1),
      color: Color.fromRGBO(1, 113, 255, 1),
      //colorBrightness: Brightness.dark,
      child: Text(text),
    );
  }
}
