import 'package:flutter/material.dart';
import 'package:funi_gift/router.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
//   Widget _createItem(String title, {Function onTap}) {
//     return GestureDetector(
//         onTap: onTap,
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[Text(title)],
//           ),
//         ));
//   }

  Widget _createItem(String title, {Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, left: 24, right: 24),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFC7C7C7), width: 0.5),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createItem('照片', onTap: () {
              Router.pushName(context, 'SecondPage');
            }),
            _createItem('视频', onTap: () {
              Router.pushName(context, 'ThirdPage');
            }),
          ],
        ),
      ),
    );
  }
}
