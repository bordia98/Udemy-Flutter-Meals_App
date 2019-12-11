import 'package:flutter/material.dart';
import './dummy_data.dart';
import './category_item.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((item){
            return CategoryItem(
              id: item.id,
              title: item.title,
              color: item.color
              );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      );
  }
}