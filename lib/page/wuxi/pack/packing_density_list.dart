import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';
import 'package:wanma_huitong/page/wuxi/pack/packing_density_detail.dart';

class PackingDensityList extends StatefulWidget {

  static final String sName = 'packing_density_list';

  @override
  _PackingDensityListState createState() => _PackingDensityListState();
}

class _PackingDensityListState extends State<PackingDensityList> {

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
        title: Text('打包'),
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
                      MaterialPageRoute(builder: (context) => PackingDensityDetail()),);
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