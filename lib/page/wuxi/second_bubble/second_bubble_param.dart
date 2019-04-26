import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_curve.dart';
import 'package:wanma_huitong/widget/middle_text.dart';

class SecondBubbleParam extends StatefulWidget {

  static final String sName = 'second_bubble_param';

  @override
  _SecondBubbleParamState createState() => _SecondBubbleParamState();
}

class _SecondBubbleParamState extends State<SecondBubbleParam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('二次发泡参数信息'),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              margin: EdgeInsets.only(left: 30.0,right: 30.0),
              child: Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top: 40,bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('投料温度', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                width: 1.0,
                              )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('发泡温度', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('上料时间', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('投料时间', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('加热时间', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('稳定时间', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('出料时间', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                          child: MiddleText('蒸汽阀开度', flag: false,),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  width: 1.0,
                                )
                            ),
                            child: Text('', style: TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
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
                          MaterialPageRoute(builder: (context) => SecondBubbleCurve()),);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
