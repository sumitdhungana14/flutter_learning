import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryGridItem(this.id, this.title, this.color);

  void openMealCategoriesScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      onTap: () => openMealCategoriesScreen(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.6), color]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title),
      ),
    );
  }
}
