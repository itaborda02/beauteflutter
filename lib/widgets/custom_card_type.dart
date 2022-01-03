import 'package:flutter/material.dart';

//IMAGEN DEL LOGIN Y REGISTRO
class CustomcadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.black,
        elevation: 20,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 60),
          child: Column(
            children: [
              Container(
                  color: Colors.black,
                  width: 200.0,
                  height: 200.0,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                        color: Colors.black,
                        width: 100.0,
                        height: 50.0,
                        child: Image(
                          image: NetworkImage(
                            'assets/image.png',
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}
