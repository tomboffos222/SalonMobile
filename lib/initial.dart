import 'package:flutter/material.dart';
class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Регистрация'),

              )
            ],
          )
        ],
      ),
    );
  }
}
