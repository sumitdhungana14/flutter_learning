import 'package:flutter/material.dart';

class MealCategoriesScreen extends StatelessWidget {
  static const routeName = '/meal-categories';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Container(),
    );
  }
}
