import 'package:flutter/material.dart';
import 'package:wanma_huitong/widget/middle_text.dart';

class FirstBubbleCurve extends StatefulWidget {

  static final String sName = 'first_bubble_curve';

  @override
  _FirstBubbleCurveState createState() => _FirstBubbleCurveState();
}

class _FirstBubbleCurveState extends State<FirstBubbleCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('一次发泡'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 300.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0)
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    MiddleText('密度上限', flag: false,),
                    MiddleText('50.00g/L', flag: false,),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    MiddleText('目标密度', flag: false,),
                    MiddleText('46.00g/L', flag: false,),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    MiddleText('密度下限', flag: false,),
                    MiddleText('47.00g/L', flag: false,),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    MiddleText('实际密度', flag: false,),
                    MiddleText('00.00g/L', flag: false,),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
