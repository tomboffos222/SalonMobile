import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/registration/register.dart';
import 'package:untitled2/registration/register_second.dart';
import 'package:untitled2/salon_page/main_page.dart';

import 'initial.dart';
import 'inner_pages/MainPage.dart';







void main(){

  initializeDateFormatting().then((_) => runApp(MyApp()));

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(77, 19, 209, 1),
        accentColor: Color.fromRGBO(77, 19, 209, 1),

        textTheme: TextTheme(

          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color:Colors.white,fontSize: 25),
          subtitle1: TextStyle(color:Colors.white,fontSize: 15),
          subtitle2: TextStyle(color:Colors.black,fontSize: 15,),
          headline1: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),



        )
      ),
      title: 'New App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/main' : (BuildContext context) => Initial(),
        '/register': (BuildContext context) => Register(),
        '/' : (BuildContext context)=>MainPage(),



      },


    );
  }
}



