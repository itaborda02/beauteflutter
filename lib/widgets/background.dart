import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          stops: [
        0.2,
        0.8
      ],
          colors: [
        Color.fromRGBO(0, 0, 0, 1),
        Color.fromRGBO(10, 0, 30, 1),
      ]));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //color azul y gris degradado
        Container(
          decoration: boxDecoration,
        ),
        //caja azul
        Positioned(top: -100, left: -50, child: __BlueBox()),
      ],
    );
  }
}

//cajas de texto
class __BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 10.0,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              //cuando se ingresa texto entra el color blanco
          //Color.fromRGBO(255, 255, 255, 1),
          //Color.fromRGBO(0, 142, 188, 1),
        ])),
      ),
    );
  }
}
