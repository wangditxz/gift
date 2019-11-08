import 'package:flutter/material.dart';
import 'package:anvil_effect/anvil_effect.dart';
import 'package:funi_gift/router.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createItem(
                AnvilEffectWidget(
                  child: Text(
                    "👇点击👇",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                height: 40),
            createItem(ExplosionWidget(
                onCompleted: () {
                  Router.pushName(context, 'FirstPage');
                },
                tag: "开始",
                child: Container(
                    alignment: Alignment.center,
                    // color: Colors.blueAccent,
                    child: Text(
                      "开始",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ))))
          ],
        ),
      ),
    );
  }
}

Widget createItem(Widget child,
    {VoidCallback onTap,
    Color bgColor = Colors.transparent,
    double height = 100}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bgColor,
        child: child,
        height: height,
        alignment: Alignment.center,
      ));
}
