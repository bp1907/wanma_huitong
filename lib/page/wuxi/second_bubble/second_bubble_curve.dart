import 'package:flutter/material.dart';

class SecondBubbleCurve extends StatefulWidget {
  @override
  _SecondBubbleCurveState createState() => _SecondBubbleCurveState();
}

class _SecondBubbleCurveState extends State<SecondBubbleCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('二次发泡'),
      ),
      body: Center(
        child: Text('二次发泡曲线'),
      ),
    );
  }
}
