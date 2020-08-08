import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/salon_page/master_choose.dart';

class SalonPage extends StatefulWidget {
  final salon;

  const SalonPage({Key key, this.salon}) : super(key: key);
  @override
  _SalonPageState createState() => _SalonPageState(salon);
}

class _SalonPageState extends State<SalonPage> {
  var salon;
  var prices;
  var posts;
  _SalonPageState(salon){
    this.salon = salon;






  }
  var counter_prices;
  var posts_prices;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prices = salon['salon_prices'];

      for(int i=0;i<(prices.length);i++){

         i==0 ? counter_prices = [i] : counter_prices.add(i);

      }
      print(counter_prices);
    posts = salon['salon_posts'];
    for(int i=0;i<(posts.length);i++){

      i==0 ? posts_prices = [i] : posts_prices.add(i);

    }




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salon['title']),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                image: DecorationImage(
                  image: NetworkImage(salon['avatar']),
                  fit: BoxFit.cover

                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Column(
                  children: <Widget>[
                    Center(

                      child: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                            child: Text(
                              '${salon['title']}', style: Theme.of(context).textTheme.subtitle2,
                            )
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Text(
                                'Рейтинг \n ${salon['rating']}', textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2,
                              )
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Text(
                                'Мастеров \n ${salon['masters']}', textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2,
                              )
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    )

                  ],

                ),

              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:18.0, left: 20),
                  child: Text('Наши услуги', style: Theme.of(context).textTheme.headline1,),
                ),

                CarouselSlider(
                  options: CarouselOptions(
                      height: 350,
                      enableInfiniteScroll:true,
                      viewportFraction: 0.7,
                      aspectRatio: 2.0,



                  ),
                  items: counter_prices.map<Widget>((i){
                    return Builder(
                      builder: (BuildContext context){
                        var price = prices[i];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              )
                            ],

                          ),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[


                                Image.network(price['price_medias'].isNotEmpty ? price['price_medias'][0]['media_link'] : 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHbwBs_wOykRFIfV8if3F1xAW3fQRB_0zuew&usqp=CAU'),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(price['title'], style: TextStyle(fontSize: 20,color: Colors.black87),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '${price['price']} тг',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Theme.of(context).accentColor,
                                              fontWeight: FontWeight.bold,

                                          ),


                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0),
                                      child: Center(
                                        child:RaisedButton(
                                          child: Text('Записаться', style: Theme.of(context).textTheme.subtitle1,),
                                          color: Theme.of(context).accentColor,
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MasterChoose(price: price,)));
                                          },

                                        ),
                                      ),
                                    )


                                  ],
                                ),
                              ),


                            ],
                          ),
                        );
                      },
                    );
                  }).toList()
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 100),

                  child: posts!=null ? GridView.builder(

                    shrinkWrap: true,
                    itemCount: posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.2),
                    itemBuilder: (BuildContext context, int index){
                      var post = posts[index];
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(post['post_medias'][0]['media_link']),
                            fit: BoxFit.fill
                          )
                        ),
                      );
                    },




                  ):
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  )


                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
