import 'package:flutter/material.dart';
class SecondPart extends StatefulWidget {
  final String username;

  const SecondPart({Key key, this.username}) : super(key: key);


  @override
  _SecondPartState createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 50,
                  height: 40,
                  buttonColor: Colors.white,
                  child: RaisedButton(

                    child: Icon(Icons.chevron_left, size: 25.0,),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)

                    ),
                    onPressed: (){
                      Navigator.pop(context);

                    },
                  ),


                ),
                Text(
                  'Добро пожаловать  ${widget.username} \n  введите  пароль',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: TextField(
                style: TextStyle(fontSize: 22.0),

                textAlign: TextAlign.end,


                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),



                  labelText: 'Придумайте пароль',

                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                style: TextStyle(fontSize: 22.0),

                textAlign: TextAlign.end,


                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),

                  labelText: 'Повторите пароль',

                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
