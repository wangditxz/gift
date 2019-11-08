import 'package:flutter/material.dart';
import 'package:funi_gift/page/FirstPage.dart';
import 'package:funi_gift/page/Home.dart';
import 'package:funi_gift/page/ListPage.dart';
import 'package:funi_gift/page/SecondPage.dart';
import 'package:funi_gift/page/ThirdPage.dart';


class Router {
  static Map<String, WidgetBuilder> allRouters() {
    return {
      "RootPage": (context) => Home(),
      "FirstPage": (context) => FirstPage(),
      "SecondPage": (context) => SecondPage(),
      "ThirdPage": (context) => ThirdPage(),
      "ListPage": (context) => ListPage(),
    };
  }

  static void pushName(BuildContext context, String name,
      [Map<String, dynamic> params]) {
    if (params == null) {
      Navigator.pushNamed(context, name);
      return;
    }
    Navigator.pushNamed(context, name, arguments: params);
  }

  static void pushNamedAndRemoveUntil(BuildContext context,
      {String name = 'RootPage'}) {
    Navigator.pushNamedAndRemoveUntil(
        context, name, (Route<dynamic> route) => false);
  }
  
  static void pushReplacementNamed(BuildContext context,
      {String name = 'RootPage'}) {    
    Navigator.pushReplacementNamed(context, name);
  }

  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static bool pop(BuildContext context) {
    return Navigator.pop(context);
  }

  static Widget getInitPage({isLogin = false}) {
    return Home();
  }
}
