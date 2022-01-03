import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/utils/citas.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BEAUTE',
      initialRoute: 'registro',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'registro' : (_) => RegisterPage(),
        'citas': (_) => CitasScreen(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.blueGrey),
    );
  }
}
