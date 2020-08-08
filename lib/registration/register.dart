import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/components/validation.dart';
import 'package:untitled2/registration/register_second.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _username;
  var exception;
  var username;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var exception;



    _username = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _username.dispose();
    exception.dispose();
    super.dispose();
  }

  validatorCheck(String login) {
    setState(() async{


        if(login == null){
          exception = null;
          
        }else{
          var response = await http.post('http://127.0.0.1:8000/api/login/check',body:{
            'username' : login

          });

          if(response.statusCode == 409){
            exception = [
              response.body
            ];


          }
        }




    });
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),

        child: Column(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                    'Регистрация',

                    style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            if(exception != null)

              ValidationMessage(exception),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),

              child: TextField(
                style: TextStyle(fontSize: 22.0),
                controller: _username,
                textAlign: TextAlign.end,
                onChanged: (login){
                  validatorCheck(login);
                },
                onSubmitted: (String value){
                  if(exception == true){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>SecondPart(username: username)
                    ));
                  }

                },

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
                  labelText: 'Придумайте логин',

                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }



  

  


  
}

