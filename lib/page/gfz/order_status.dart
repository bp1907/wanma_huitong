import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {

  static final String sName = 'order_status';

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单状态'),
        centerTitle: true,
        leading: InkWell(
          child: Container(
            margin: const EdgeInsets.only(left: 12.0,right: 10.0),
            child: Icon(Icons.chevron_left,color: Colors.white,),
          ),
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Text(
                    '客户',
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '下单日期',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '交货日期',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '状态',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

