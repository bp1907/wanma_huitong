import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_param.dart';

class SecondBubbleList extends StatefulWidget {

  static final String sName = 'second_bubble_list';

  @override
  _SecondBubbleListState createState() => _SecondBubbleListState();
}

class _SecondBubbleListState extends State<SecondBubbleList> {

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
        title: Text('二次发泡'),
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
                      MaterialPageRoute(builder: (context) => SecondBubbleParam()),);
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
