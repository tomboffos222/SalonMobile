import 'package:flutter/material.dart';
import 'package:untitled2/salon_page/main_page.dart';

class SalonCard extends StatefulWidget {
  final salon;


  const SalonCard({Key key, this.salon}) : super(key: key);
  @override
  _SalonCardState createState() => _SalonCardState(salon);
}

class _SalonCardState extends State<SalonCard> {
  var salon;
  _SalonCardState(salon){
    this.salon = salon;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3)
          )
        ]
      ),
      child: Padding(

        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new SalonPage(salon: salon,)));
          },
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              salon['avatar'],



            ),
          ),
          title: Text(
              salon['title'],
              style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(
                salon['address'],
                style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          trailing: RawMaterialButton(
            elevation: 2,
            fillColor: Colors.green,
            child: Icon(
              Icons.forward,
              color: Colors.white,

            ),
            shape: CircleBorder(),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new SalonPage(salon: salon,)));
            },
          ),




        ),

      ),
    );
  }
}
