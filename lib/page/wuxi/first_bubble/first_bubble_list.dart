import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';

class FirstBubbleList extends StatefulWidget {

  static final String sName = 'first_bubble_list';

  @override
  _FirstBubbleListState createState() => _FirstBubbleListState();
}

class _FirstBubbleListState extends State<FirstBubbleList> {

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
        title: Text('一次发泡'),
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
                      MaterialPageRoute(builder: (context) => FirstBubbleDetail()),);
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
