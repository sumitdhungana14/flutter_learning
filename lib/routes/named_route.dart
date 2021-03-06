import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/filters_screen.dart';

import '../screens/meal_screen.dart';
import '../screens/category_meals_screen.dart';
class NamedRoute {
  static Map<String, Widget Function(BuildContext)> getNamedRoute(
      Map<String, bool> filters,
      Function setFilters,
      Function isFavourite,
      Function toggleFavourite) {
    return {
      CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(filters),
      MealScreen.routeName: (_) => MealScreen(isFavourite, toggleFavourite),
      FiltersScreen.routeName: (_) => FiltersScreen(filters, setFilters),
    };
  }
}
