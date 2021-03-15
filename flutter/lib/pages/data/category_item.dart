import 'package:flutter/material.dart';

import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;
  final String featuredimage;
  final String longdescription;

  CategoryItem(this.id, this.title, this.color, this.image, this.featuredimage, this.longdescription);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealsScreen(id, title, image, featuredimage, longdescription);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child:
          new Card(key: null,      elevation: 0,color:Colors.transparent,
            child:
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
 Image.asset(image, height: 100,),
 new Container(
height:10,                  ),
            Text(
                  title,
                    style: new TextStyle(fontSize:14.0,
                    color: Colors.red,
                    fontFamily: "Poppins",
            fontWeight: FontWeight.w800,  )  )
                ]

              ),

          ),

      ),

    );
  }
}

  