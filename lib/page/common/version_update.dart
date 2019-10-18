import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'dart:io';
class VersionUpdate extends StatelessWidget {
  final List<String> _funcList = <String>['联系我们','功能介绍','版本更新'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('版本更新'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _description(context),
            _listMenu(context,_funcList)
          ],
        ),
      ),
    );
  }
}
//图标 版本简介
Widget _description(context){
  
return StoreBuilder<WMState>(
        builder: (context,store){
return Container(
  padding: EdgeInsets.only(top:20),
  child:Center(
  child: Column(
    children: <Widget>[
      Container(
        width: 80,
        height: 80,
        child:  CircleAvatar(
         backgroundImage: store.state.userInfo.image == null ? AssetImage('images/logo.png') : FileImage(File(store.state.userInfo.image)),
      ),
      ),
      
      Container(
        padding: EdgeInsets.only(top: 20,bottom: 5),
        child:Text('万马集团',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
      ),
      Text('Version 0.0.1',style: TextStyle(fontSize: 15))
    ],
  ),
  )
);
        }

);
}
//功能列表
Widget _listMenu(context, List list){
  List<Widget> _listWidget = new List();
  for (int i=0;i< list.length;i++) {
    _listWidget.add(ListTile(title:Text(list[i],style: TextStyle(fontSize: 18),),
           trailing: Icon(Icons.arrow_forward_ios,size: 18,),
           onTap: (){
           }, 
     ));
  }
return Container(
  padding: EdgeInsets.only(top: 30),
  height: 300,
    child: ListView(
      padding: EdgeInsets.all(20),
    children:  ListTile.divideTiles(context: context,tiles: _listWidget).toList()
    )
);

}