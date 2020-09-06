import 'package:flutter/material.dart';

import './../models/meal.dart';
import './../screens/meal_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  void openMealScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealScreen.routeName, arguments: {'meal': meal});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openMealScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(meal.imageUrl,
                  height: 200, width: double.infinity, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 250,
                color: Colors.black54,
                child: Text(
                  meal.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
          ]),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(meal.complexity
                          .toString()
                          .substring('complexity'.length + 1))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(meal.affordability
                          .toString()
                          .substring('affordability'.length + 1))
                    ],
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
