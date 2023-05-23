import 'package:flutter/material.dart';

class TextUnderLogo extends StatelessWidget {
  final String text;
  const TextUnderLogo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }
}
