import 'package:flutter/material.dart';


//tabs de la parte inferior de los inconos 
class TabsNavigations extends StatelessWidget {
  
  const TabsNavigations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 0,
      items: [
      BottomNavigationBarItem(icon:Icon(Icons.home),
      label: 'home'
      ),
      BottomNavigationBarItem(icon:Icon(Icons.calendar_today),
      label: 'Calendario'
      ),
      BottomNavigationBarItem(icon:Icon(Icons.supervised_user_circle_outlined),
      label: 'Usuario'
      ),
    ],
    
    );
    
  }
}