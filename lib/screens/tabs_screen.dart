import 'package:flutter/material.dart';

import './../screens/categories_screen.dart';
import './../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'My Favourites'}
  ]; 

  int selectedIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(pages[selectedIndex]['title'])),
        body: pages[selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectItem,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedIndex,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Favourites')),
        ],),
    );
  }
}
