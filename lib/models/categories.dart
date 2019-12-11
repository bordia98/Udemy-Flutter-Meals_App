import 'package:flutter/material.dart';

class CategoriesStructure{
  final String id;
  final String title;
  final Color color;

  const CategoriesStructure(
    {@required this.id,
    @required this.title,
    this.color = Colors.yellow 
  });

}