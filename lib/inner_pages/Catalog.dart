import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'elements/salon_component.dart';





class Salons extends StatefulWidget {
  final String title;

  const Salons({Key key, this.title}) : super(key: key);
  @override
  _SalonsState createState() => _SalonsState(title);

}

class _SalonsState extends State<Salons> {
  var salons,response;
  String title;
  _SalonsState(String title){
    this.title = title;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();






  }
  fetchData() async{

    response = await http.get('http://127.0.0.1:8000/api/salons/');

    salons = json.decode(utf8.decode(response.bodyBytes))['data'];
    print(salons);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title'),),
      body: Padding(
        padding: EdgeInsets.only(top: 0.0, left: 0, right: 0),
        child: response != null ?
            ListView.builder(
              itemCount: salons.length,
              itemBuilder: (context, index){
                var salon = salons[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: SalonCard(
                    salon: salon
                  ),
                );
              },
            ):

            Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
      )
    );
  }



}



class Salon{
  final int id;
  final String title;
  final String avatar;

  Salon({this.id,this.title,this.avatar});






}