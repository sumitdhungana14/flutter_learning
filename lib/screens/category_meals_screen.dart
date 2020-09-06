import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../mocks/meal_mock.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/meal-categories';

  final Map<String, bool> filters;

  const CategoryMealsScreen(this.filters);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final meals =
        MealMock.getMealsByCategory(routeArgs['id']).where((meal) {
      if (!meal.isGlutenFree && filters['gluten']) {
        return false;
      }
      if (!meal.isLactoseFree && filters['lactose']) {
        return false;
      }
      if (!meal.isVegan && filters['vegan']) {
        return false;
      }
      if (!meal.isVegetarian && filters['vegetarian']) {
        return false;
      }
      return true;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
