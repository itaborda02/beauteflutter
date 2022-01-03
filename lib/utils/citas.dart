import 'dart:html';

import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:productos_app/screens/home_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class CitasScreen extends StatelessWidget {
  

  var formValues;

  var form;



  @override
  Widget build(BuildContext context) {
     final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    var children2 = <Widget>[
                      CustomInputCitas(
                        labelText: 'Nombre',
                        hintText: 'Nombre del usuario',
                        icon: Icons.account_circle_outlined,
                      ),
                      SizedBox(height: 30),
                      CustomInputCitas(
                        labelText: 'Apellido',
                        hintText: 'Apellido del usuario',
                        icon: Icons.face_outlined,
                      ),
                      SizedBox(height: 30),
                      CustomInputCitas(
                        labelText: 'Direccion',
                        hintText: 'Direccion  del usuario',
                        icon: Icons.location_city,
                      ),
                      Divider(),
                     Icon(Icons.date_range,),TimeForm(formKey: formValues,) ,
                      SizedBox(height: 30,),
                       DropdownButtonFormField<String>(
                         
                         style: TextStyle(backgroundColor: Colors.white54,  color: Colors.black,fontSize:18.0),
                         
                  value: 'Ciudad',
                  items: [
                    DropdownMenuItem( value: 'Ciudad', child: Text('Envigado',)),
                    DropdownMenuItem( value: 'Medellin', child: Text('Medellin')),
                    DropdownMenuItem( value: 'Cucuta', child: Text('Cucuta')),
                    DropdownMenuItem( value: 'Bello', child: Text('Bello')),
                  ],
                  onChanged: ( value ) {
                    print(value);
                    formValues['role'] = value ?? 'Ciudad';
                  }

                ),
               SelectService(),


                SizedBox(height: 40,),
          

                 ElevatedButton(
                   child: const SizedBox(
                     width: double.infinity,
                     child: Center(child: const Text('Guardar'))
                    ),
                   onPressed: () {

                      FocusScope.of(context).requestFocus( FocusNode() );

                      if ( !myFormKey.currentState!.validate() ) {
                        print('Formulario no válido');
                        return;
                      }

                      //* imprimir valores del formulario
                      print(formValues);
                   }, 
                  )
                    
                    ];
    return Container(
      child: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text('Agenda tu cita ',
                style: TextStyle(backgroundColor: Colors.black)),
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: children2,
                    
                  )))),
    );
  }
}


