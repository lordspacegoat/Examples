import 'package:flutter/material.dart';

class Shop {
  final String id;
  final String title;
  final String image;
  final String cost;
  final String featuredimage;
  final String longdescription;
  final String link;

  const Shop({
    @required this.id,
    @required this.cost,
    @required this.title,
    @required this.image,
    @required this.featuredimage,
    @required this.longdescription,
    @required this.link,
  });
}
