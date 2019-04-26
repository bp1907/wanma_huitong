import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/prepressure_tank_curve.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_param.dart';

class PrepressureTankList extends StatefulWidget {

  static final String sName = 'prepressure_tank_list';

  @override
  _PrepressureTankListState createState() => _PrepressureTankListState();
}

class _PrepressureTankListState extends State<PrepressureTankList> {

  List list = [
    '1号线',
    '2号线',
    '3号线',
    '4号线',
    '5号线',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('预压罐清单'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(list[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrepressureTankCurve()),);
                },
              ),
              Divider(height: 2.0,),
            ],
          );
        },
      ),
    );
  }
}
