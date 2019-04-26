import 'package:flutter/material.dart';
import 'package:wanma_huitong/widget/middle_text.dart';

class PrepressureTankCurve extends StatefulWidget {

  static final String sName = 'prepressure_tank_curve';
  
  @override
  _PrepressureTankCurveState createState() => _PrepressureTankCurveState();
}

class _PrepressureTankCurveState extends State<PrepressureTankCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('预压罐曲线'),
      ),
      body: Container(
        child: Column(
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
                      MiddleText('PV', flag: false,),
                      MiddleText('50.00Mpa', flag: false,),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: <Widget>[
                      MiddleText('SP', flag: false,),
                      MiddleText('46.00Mpa', flag: false,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
