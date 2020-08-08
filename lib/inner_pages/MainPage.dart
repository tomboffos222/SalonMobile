import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/inner_pages/profile.dart';
import 'package:untitled2/salon_page/main_page.dart';

import 'Catalog.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({Key key, this.title}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState(title);
}

class _MainPageState extends State<MainPage> {
  String title;
  _MainPageState(String title){
    this.title = title;
  }
  int _currentIndex = 0;
  final tabs = [
      Salons(title: 'Все наши салоны',),
      Profile()
  ];



  PageController pageController =  PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 15 ,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Главная'),


            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Главная'),

            )
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),


      );

  }
}
