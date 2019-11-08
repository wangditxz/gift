import 'package:flutter/material.dart';
import 'package:flutter_effects/flutter_text_effect.dart';
import 'package:funi_gift/router.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  int diffScaleNext = 0;
  final sentences = ['老婆我爱你', '和你在一起的这几年', '我们经历了无数的风雨', '但最终发现我越来越爱你'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: createItem(
              DiffScaleText(
                text: sentences[diffScaleNext % sentences.length],
                textStyle: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              bgColor: Colors.black, onTap: () {
            setState(() {
              if (diffScaleNext + 1 == sentences.length) {
                Router.pushName(context, 'ListPage');
              }
              diffScaleNext++;
            });
          }),
        ),
      ),
    );
  }
}

Widget createItem(Widget child,
    {VoidCallback onTap, Color bgColor = Colors.transparent}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bgColor,
        child: child,
        height: 100,
        alignment: Alignment.center,
      ));
}
