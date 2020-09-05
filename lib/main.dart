import 'package:flutter/material.dart';
import 'package:flutter_app/meal-categories/categories_screen.dart';
import 'package:flutter_app/mocks/category_mock.dart';

import './routes/named_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(),
              )),
      home: CategoriesScreen(CategoryMock.getCategory()),
      routes: NamedRoute.namedRoute,
    );
  }
}
