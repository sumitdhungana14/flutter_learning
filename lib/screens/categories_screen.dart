import 'package:flutter/material.dart';

import '../widgets/category_grid_item.dart';
import './../models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  final List<Category> categories;

  const CategoriesScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: GridView(
          children: categories
              .map((category) => CategoryGridItem(category.id, category.title, category.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2 ,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),
      );
  }
}
