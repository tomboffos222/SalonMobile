
import 'package:flutter/material.dart';
import 'package:untitled2/components/Exceptions.dart';
class ValidationMessage extends StatefulWidget {

  final Exceptions exceptions;

  const ValidationMessage(exception, {Key key, this.exceptions}) : super(key: key);
  @override
  _ValidationMessageState createState() => _ValidationMessageState();
}

class _ValidationMessageState extends State<ValidationMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(

          height: 50,
          color: Colors.green,
          child: Center(
            child: Column(
              children: <Widget>[
                
              ],
            ),
          )
        ),
      ),
    );
  }
}
