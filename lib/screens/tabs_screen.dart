import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/main_drawer.dart';

import './../screens/categories_screen.dart';
import './../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  int selectedIndex = 0;

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'My Favourites'
      }
    ];
    super.initState();
  }

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectedIndex]['title'])),
      drawer: MainDrawer(),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectItem,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites')),
        ],
      ),
    );
  }
}
