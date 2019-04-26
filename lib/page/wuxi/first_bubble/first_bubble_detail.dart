import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_curve.dart';
import 'package:wanma_huitong/widget/middle_text.dart';

class FirstBubbleDetail extends StatefulWidget {

  static final String sName = 'first_bubble_detail';

  @override
  _FirstBubbleDetailState createState() => _FirstBubbleDetailState();
}

class _FirstBubbleDetailState extends State<FirstBubbleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('一次发泡'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MiddleText('进料',flag: false,),
                MiddleText('1水'),
                MiddleText('2水'),
                Text(''),
                MiddleText('完成'),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MiddleText('加热',flag: false,),
                MiddleText('低'),
                MiddleText('中'),
                MiddleText('高'),
                MiddleText('完成'),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MiddleText('CO2加压\n状态',flag: false,),
                MiddleText('一压'),
                MiddleText('二压'),
                MiddleText('三压'),
                MiddleText('四压'),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MiddleText('放料',flag: false,),
                MiddleText('中间'),
                MiddleText('终止'),
                MiddleText('卸压'),
                MiddleText('完成'),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MiddleText('蒸汽压力',flag: false,),
                MiddleText('釜内压力',flag: false,),
                MiddleText('CO2储罐压力',flag: false,),
              ],
            ),
            Padding(padding: const EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MiddleText('0.01MPa',flag: false,),
                MiddleText('0.02MPa',flag: false,),
                MiddleText('0.03MPa',flag: false,),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MiddleText('温度',flag: false,),
                MiddleText('段剩余时间',flag: false,),
                MiddleText('基准B压',flag: false,),
              ],
            ),
            Padding(padding: const EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MiddleText('18C',flag: false,),
                MiddleText('20分钟',flag: false,),
                MiddleText('0.03MPa',flag: false,),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20)),
            RaisedButton(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: <Widget>[
                  Text('查看',style: TextStyle(fontSize: 20.0),maxLines: 1,),
                ],
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstBubbleCurve()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}