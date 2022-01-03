import 'package:flutter/material.dart';
import 'package:productos_app/screens/login_screen.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:productos_app/widgets/background.dart';
import 'package:productos_app/widgets/carrusel_image.dart';
import 'package:productos_app/widgets/tabs_navigations.dart';
import 'package:productos_app/widgets/card_table.dart';

class HomeScreen extends StatelessWidget {
  get text => null;

  @override
  Widget build(BuildContext context) {
    return BoxTitle();
  }
}

class BoxTitle extends StatelessWidget {
  const BoxTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bienvenido'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          )
        ],
      ),
      body: Stack(
        children: [
          // Background
          Background(),
          // Home Body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: TabsNavigations(),
    ));
  }
}

class AutService {}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Titulos
          PageTitle(),
         

          // Card Table
          CardTable(),
        
        ],
      ),
    );
  }
}
