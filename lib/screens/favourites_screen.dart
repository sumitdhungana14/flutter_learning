import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.length == 0
        ? Center(
            child: Text(
              'Looks a bit empty here!',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(favouriteMeals[index]);
            },
            itemCount: favouriteMeals.length,
          );
  }
}
