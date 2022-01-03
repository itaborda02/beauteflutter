import 'dart:async';
import 'dart:html';

import 'package:date_format/date_format.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:productos_app/screens/home_screen.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class CustomInputCitas extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;

  const CustomInputCitas({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        initialValue: '',
        textCapitalization: TextCapitalization.words,
        onChanged: (value) => {print('value :$value')},
        validator: (value) {
          if (value == null) return 'este campo es requerido ';
          return value.length < 3 ? 'minimo 3 caracteres' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          icon: icon == null ? null : Icon(icon),
        ));
  }
}

//calendario citas
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
              
                  constraints: BoxConstraints(maxWidth: 600),
                  child: DateTimeForm(
                    
                  ))),
        ));
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  DateTimeFormState createState() => DateTimeFormState();
}

class DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return TimeForm(
      
      formKey: formKey,
    );
  }
}

class TimeForm extends StatelessWidget {
  const TimeForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 24,
            width: 30,
          ),
          BasicDateTimeField(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Dia y hora de cita de peluqueria (${format.pattern})'),
      FechaCitas(
        format: format,
        style: Colors.black,
      ),
    ]);
  }
}

class FechaCitas extends StatelessWidget {
  const FechaCitas({
    Key? key,
    required this.format,
    Color? style,
  }) : super(key: key);

  final DateFormat format;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
        } else {
          return currentValue;
        }
      },
    );
  }
}

String? selectedValue;
List<String> items = [
  'Corte de cabello',
  'Manicure',
  'Pedicure',
  'Planchado',
  'Arreglo de pestañas',
  'Alisado',
];

@override
Widget build(BuildContext context) {
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  return Scaffold(
    body: Container(
      constraints: BoxConstraints(maxWidth: 600),
      width: double.infinity,
      child: SelectService(),
    ),
  );
}

// ignore: must_be_immutable
class SelectService extends StatelessWidget {
  var formValues;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        icon: Icon(Icons.assignment),
        hint: Text(
          'Seleccione el servicio que desea',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          print(value);
          formValues[''] = value ?? 'seletedValue';
        },
        buttonHeight: 160,
        buttonWidth: 240,
        itemHeight: 135,
        itemWidth: 160,
      ),
    );
  }
}

void setState(Null Function() param0) {}
