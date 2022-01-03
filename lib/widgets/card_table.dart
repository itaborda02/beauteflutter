import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/utils/citas.dart';

//DASBOARD DE ICONOS  Y SUS SUBTITULOS
class CardTable extends StatelessWidget {
  static String route = '/';
  @override
  Widget build(BuildContext context) {
    //TABLE COLECCION DE TABLAS

    return Table(children: [
      //TARJETAS DE ICONOS CALL
      TableRow(children: [
        _SingleCard(
          color: Color.fromRGBO(255, 255, 255, 1),
          icon: Icons.phone_callback,
          text: 'Contacto',
          boton: TextButton(
              onPressed: () => Navigator.pushNamed(context, 'citas'),
              child: SizedBox(
                width: 100,
                height: 70,
              )),
        ),
        _SingleCard(
            boton: '',
            color: Color.fromRGBO(255, 255, 255, 1),
            icon: Icons.event_available,
            text: 'Citas agendadas'),
      ]),
      TableRow(children: [
        _SingleCard(
          color: Color.fromRGBO(255, 255, 255, 1),
          icon: Icons.person_search,
          text: 'Buscar profesional',
          boton: '',
        ),
        _SingleCard(
          color: Colors.white,
          icon: Icons.shop,
          text: 'Compra de productos',
          boton: '',
        )
      ]),
      TableRow(children: [
        _SingleCard(
          color: Color.fromRGBO(255, 255, 255, 1),
          icon: Icons.favorite,
          text: 'Favoritos',
          boton: '',
        ),
        _SingleCard(
          color: Colors.white,
          icon: Icons.card_giftcard_outlined,
          text: 'General',
          boton: '',
        )
      ]),
    ]);
  }
}

//FONDO DE LAS TARJETAS
class _SingleCard extends StatelessWidget {
  final Color color;
  final String text;
  final boton;
  final icon;

  const _SingleCard({
    Key? key,
    required this.color,
    required this.text,
    required this.boton, this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
        margin: EdgeInsets.all(15),
        height: 180,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.blue,
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
       Icon(this.icon,size: 75,
              color: Color.fromRGBO(255, 255, 255, 1),
              
            ),
          SizedBox(height: 20),
          Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
        ]));
  }
}
