import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final String image;
  final String cost;
  final String featuredImage;
  final String longdescription;
  final String link;

  

  ShopMealsScreen(this.categoryId, this.categoryTitle, this.image, this.cost, this.featuredImage, this.longdescription, this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:
      new SingleChildScrollView(
    child:
      new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Center(
            child:
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                
                ]

              ),

          ),

          new Container(
           height:30,
          ),

Padding(
  padding: EdgeInsets.all(20.0),
  child: 
          new Text(
          longdescription,
            style: new TextStyle(fontSize:28.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w800,
            )
          ),),

Padding(
  padding: EdgeInsets.all(20.0),
  child: new Image.network(featuredImage, height: 200,)

                  ),
                  Padding(
  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
  child: new Text(
          cost,
            style: new TextStyle(fontSize:22.0,
            color: Colors.black,
            height: 1.8,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
             ),
),

                  ),
                   new Container(
           height:30,
          ),
               RaisedButton(key:null, onPressed: () => _yoyo(link),
            color: Color.fromRGBO(205, 23, 25, 1),
            shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      
    ),
            child:
              new Text(
              "View More",
                style: new TextStyle(fontSize:18.0,
                letterSpacing: 1,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w800,
                fontFamily: "Poppins")
              )
            ),
                  
        ]

      ),
      
    )
    );
  } 
}
 void _yoyo(String link) async {
  if (await canLaunch(link)) { 
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
} 
