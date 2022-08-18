import 'dart:math';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Color.fromARGB(202, 37, 89, 124),
      ),
    ]);
  }
}
