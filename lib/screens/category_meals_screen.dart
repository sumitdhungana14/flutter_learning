import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../mocks/meal_mock.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/meal-categories';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final meals = MealMock.getMealsByCategory(routeArgs['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(meals[index]);
      },
      itemCount: meals.length,),
    );
  }
}
