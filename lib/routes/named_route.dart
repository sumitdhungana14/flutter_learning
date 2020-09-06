import 'package:flutter_app/screens/filters_screen.dart';

import '../screens/meal_screen.dart';
import '../screens/category_meals_screen.dart';

class NamedRoute {

  static var namedRoute = {
    CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
    MealScreen.routeName: (_) => MealScreen(),
    FiltersScreen.routeName: (_) => FiltersScreen(),
  };
}
