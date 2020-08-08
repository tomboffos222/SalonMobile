import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class MasterChoose extends StatefulWidget {
  final price;

  const MasterChoose({Key key, this.price}) : super(key: key);
  @override
  _MasterChooseState createState() => _MasterChooseState(price);
}

class _MasterChooseState extends State<MasterChoose> {
  var price;
  var medias;
  var media_counter;
  _MasterChooseState(price){
    this.price = price;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    medias = price['price_medias'];
    print(price['salon_masters']);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${price['title']}'),
      ),
      body: Column(
        children: <Widget>[

          Container(
           child: medias.length != 0   ? CarouselSlider.builder(
              itemCount: medias.length,
              itemBuilder: (context ,index){
                var media = medias[index];
                return Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(media['media_link']),
                        fit: BoxFit.fill
                      )
                    ),
                );

              },
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction: 1,
                enlargeCenterPage: true,
              )
           ):Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/640x360'),
                      fit: BoxFit.fill
                  )
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Center(child: Text('Выберите мастера', style: Theme.of(context).textTheme.headline1,)),
          price['salon_masters'] != null ? ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container(

                );
              }
          ): Center(
            child: Text('Нету доступных мастеров'),
          ),

        ],


      ),
    );
  }
}
