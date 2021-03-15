import 'package:flutter/material.dart';
import 'data/dummy_data.dart';
import 'data/category_item.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return 
      GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                    catData.image,
                    catData.featuredimage,
                    catData.longdescription,
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
