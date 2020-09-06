import 'package:flutter/material.dart';
import 'package:flutter_app/mocks/meal_mock.dart';
import 'package:flutter_app/models/meal.dart';

import './screens/not_found_screen.dart';
import './screens/tabs_screen.dart';
import './routes/named_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String, bool> newFiltes) {
    setState(() {
      filters['gluten'] = newFiltes['gluten'];
      filters['lactose'] = newFiltes['lactose'];
      filters['vegan'] = newFiltes['vegan'];
      filters['vegetarian'] = newFiltes['vegetarian'];
    });
  }

  List<Meal> favouriteMeals = [];

  void toggleFavourite(String mealId) {
    var meals = MealMock.meals;
    var meal = meals.firstWhere((element) => element.id == mealId);
    var mealIndex = favouriteMeals.indexOf(meal);

    if (mealIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
    }
  }

  bool isFavorite(String mealId) {
    return favouriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(),
              ),
          canvasColor: Color.fromRGBO(255, 200, 200, 0.8)),
      home: TabsScreen(favouriteMeals),
      routes: NamedRoute.getNamedRoute(
          filters, setFilters, isFavorite, toggleFavourite),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => NotFound());
      },
    );
  }
}
