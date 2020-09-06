import 'package:flutter/material.dart';
import 'package:flutter_app/mocks/category_mock.dart';
import 'package:flutter_app/models/Category.dart';
import 'package:flutter_app/screens/categories_screen.dart';
import 'package:flutter_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Category> categories;

  @override
  void initState() {
    categories = CategoryMock.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Category',
                ),
                Tab(icon: Icon(Icons.star), text: 'Favourite'),
              ],
            ),
            ),
        body: TabBarView(children: [
          CategoriesScreen(categories),
          FavouritesScreen()
        ],),
      ),
    );
  }
}
