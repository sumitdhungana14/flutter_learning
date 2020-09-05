import 'package:flutter/material.dart';
import 'package:flutter_app/meal-categories/category_grid.dart';

import './../models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  final List<Category> categories;

  const CategoriesScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GridView(
          children: categories
              .map((category) => CategoryGrid(category.id, category.title, category.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2 ,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),
      ),
    );
  }
}
