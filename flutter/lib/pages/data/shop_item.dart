import 'package:flutter/material.dart';
import './shop_meals_screen.dart';

class ShopItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String cost;
  final String featuredimage;
  final String longdescription;
  final String link;

  ShopItem(this.id, this.title, this.image, this.cost, this.featuredimage, this.longdescription, this.link);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return ShopMealsScreen(id, title, image, cost, featuredimage, longdescription, link);
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
 Image.asset(image, height: 150),],),),)

    );
  }
}

  