import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meals';

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget buildSectionList(BuildContext context, List list) {
    return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(list[index],
                            style: TextStyle(fontSize: 18)),
                      ),
                    );
                  },
                  itemCount: list.length));
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final meal = routeArgs['meal'] as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle('Ingredients'),
          buildSectionList(context, meal.ingredients),
          buildSectionTitle('Recipe'),
          buildSectionList(context, meal.steps),
        ]),
      ),
    );
  }
}
