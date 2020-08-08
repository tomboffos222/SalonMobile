import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://nextin.me/admin_assets/img/team-img/asyl.png',scale: 5),
                radius: 100,



              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(

            )
          ],
        ),
      ),
    );
  }
}
