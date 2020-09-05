import 'package:flutter/material.dart';

import './meal_categories_screen.dart';

class CategoryGrid extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryGrid(this.id, this.title, this.color);

  void openMealCategoriesScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealCategoriesScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
