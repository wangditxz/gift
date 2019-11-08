import 'package:flutter/material.dart';
import 'package:funi_gift/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '付妮',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Router.allRouters(),
      home: Router.getInitPage(),
    );
  }
}

