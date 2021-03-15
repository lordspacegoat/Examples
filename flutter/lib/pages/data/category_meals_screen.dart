import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final String image;
  final String featuredImage;
  final String longdescription;

  CategoryMealsScreen(this.categoryId, this.categoryTitle, this.image, this.featuredImage, this.longdescription);

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
                Image.asset(
  featuredImage,
)
                ]

              ),

          ),

          new Container(
           height:10,
          ),

          new Text(
          categoryTitle,
            style: new TextStyle(fontSize:24.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w800,
            )
          ),

Padding(
  padding: EdgeInsets.all(20.0),
  child: new Text(
          longdescription,
            style: new TextStyle(fontSize:16.0,
            color: Colors.black,
            height: 1.8,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
             ),
),

                  )
        ]

      ),
    ));
  }
}
