import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/health_bag_detail.dart';

class HealthBagList extends StatefulWidget {

  static final String sName = 'health_bag_list';

  @override
  _HealthBagListState createState() => _HealthBagListState();
}

class _HealthBagListState extends State<HealthBagList> {

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
        title: Text('养生袋清单'),
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
                      MaterialPageRoute(builder: (context) => HealthBagDetail()),);
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
