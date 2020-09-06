import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final meal = routeArgs['meal'] as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Container(),
    );
  }
}
