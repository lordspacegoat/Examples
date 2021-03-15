import 'package:flutter/material.dart';
import 'data/dummy_shop.dart';
import 'data/shop_item.dart';

class ShopScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return 
      GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => ShopItem(
                    catData.id,
                    catData.title,
                    catData.image,
                    catData.cost,
                    catData.featuredimage,
                    catData.longdescription,
                    catData.link,
                  ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );}
}
