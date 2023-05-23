import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 21),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 125,
          width: 130,
        ),
      ),
    );
  }
}
