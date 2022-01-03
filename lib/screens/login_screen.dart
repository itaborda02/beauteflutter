import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:productos_app/main.dart';
import 'package:productos_app/providers/login_form_provider.dart';

import 'package:productos_app/widgets/custom_card_type.dart';

import 'package:provider/provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomcadImage(),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          SizedBox(height: 10),
          Text(
            '¿Deseas recuperar su contraseña?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
       TextButton(onPressed: ()=>Navigator.pushReplacementNamed(context, 'register'),
       style: ButtonStyle(
         shape:MaterialStateProperty.all(StadiumBorder())
       ),
        child:    Text(
            'Crear una nueva cuenta',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),),
          SizedBox(height: 10),
        ],
      ),
    )));
  }
}

//start form
class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                style: TextStyle(color: Color.fromRGBO(244, 244, 244, 1)),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'correo@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded,
                ),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                 style: TextStyle(color: Color.fromRGBO(244, 244, 244, 1)),
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*****',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres';
                },
              ),
              SizedBox(height: 30),
              //start buttton
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  disabledColor: Colors.blue,
                  elevation: 0,
                  
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.purple])),
                      padding:
                          EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                      child: Text(
                        loginForm.isLoading ? 'Espere' : 'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (!loginForm.isValidForm()) return;

                          loginForm.isLoading = true;

                          await Future.delayed(Duration(seconds: 1));

                          // TODO: validar si el login es correcto
                          loginForm.isLoading = false;

                          Navigator.pushReplacementNamed(context, 'home');
                        })
            ],
          ),
        ),
      ),
    );
  }
}
//end form