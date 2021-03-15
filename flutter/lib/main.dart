import 'package:flutter/material.dart';
import 'pages/wifi_screen.dart';
import 'pages/categories_screen.dart';
import 'pages/shop_screen.dart';
import 'pages/map_screen.dart';
import 'pages/contact_screen.dart';
import 'helpers/firebase.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  var _pages = [

CategoriesScreen(),
WiFiScreen(),
ShopScreen(),
MapScreen(),
ContactScreen(),
  ];

  int _currentIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      title: 'Junction 29',
      theme: new ThemeData(
         buttonTheme: ButtonThemeData(
          height: 60,
          minWidth: 200,
       ),
        primaryColor: Color.fromRGBO(205, 23, 25, 1),
        fontFamily: "Poppins",
      ),
      home: Scaffold(backgroundColor: Color.fromRGBO(244, 244, 244, 1),
    appBar: AppBar(
title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/j29.png',
                  fit: BoxFit.contain,
                  height: 60,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Junction 29'))
            ],

          ),    ),
      body: 
      _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
 backgroundColor: Color.fromRGBO(205, 23, 25, 1),
  selectedItemColor: Colors.white,
  unselectedItemColor: Color.fromRGBO(255, 160, 160, 1),         items: [
           BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text('Home'),
            ),
           BottomNavigationBarItem(
              icon: const Icon(Icons.wifi),
              title: Text('WiFi'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_basket),
              title: Text('Shop'),
            ),
             BottomNavigationBarItem(
              icon: const Icon(Icons.location_on),
              title: Text('Find Us'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.card_giftcard),
              title: Text('Offers'),
            )
          ],
      
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
    ),
    );
  }
  
}
