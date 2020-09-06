import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found!'),
      ),
      body: Center(
        child:
            Text('Page doesn\'t exist.', style: TextStyle(color: Colors.red, fontSize: 24)),
      ),
    );
  }
}
