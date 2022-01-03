import 'package:flutter/material.dart';
import 'package:productos_app/widgets/background.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon,
      fontSize}) {
    return InputDecoration(     
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(36, 34, 255, 1)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        hintText: hintText,
        labelText: labelText ,
        labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Color.fromRGBO(138, 43, 226, 1))
            : null);
  }
}
