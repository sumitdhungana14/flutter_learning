import 'package:flutter/material.dart';

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
    'gluten' : false,
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
      home: TabsScreen(),
      routes: NamedRoute.getNamedRoute(filters, setFilters),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => NotFound());
      },
    );
  }
}
