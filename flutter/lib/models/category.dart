import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String image;
  final String featuredimage;
  final String longdescription;

  const Category({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.featuredimage,
    @required this.longdescription,
    this.color = Colors.orange,
  });
}
