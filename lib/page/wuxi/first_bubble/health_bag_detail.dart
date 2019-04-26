import 'package:flutter/material.dart';
import 'package:wanma_huitong/widget/middle_text.dart';

class HealthBagDetail extends StatefulWidget {

  static final String sName = 'health_bag_detail';

  @override
  _HealthBagDetailState createState() => _HealthBagDetailState();
}

class _HealthBagDetailState extends State<HealthBagDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('养生袋信息'),
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
                          child: MiddleText('产品名称', flag: false,),
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
                          child: MiddleText('原料名称批号', flag: false,),
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
                          child: MiddleText('生产日期', flag: false,),
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
                          child: MiddleText('生产批次', flag: false,),
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
                          child: MiddleText('密度范围', flag: false,),
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
                          child: MiddleText('D值', flag: false,),
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
