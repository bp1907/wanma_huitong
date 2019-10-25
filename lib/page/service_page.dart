import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/widget/grid_item.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.place, color: Theme.of(context).primaryColor,),
                Text('我的服务', style: WMConstant.bigText,)
              ],
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 10
              ),
              children: _getServiceItems(),
            ),
          ),
        ],
      ),
    );
  }

  final  List _data = [
    {'title':'科技申报'},
    {'title':'服务电话'},
    {'title':'问题反馈'},
    {'title':'来访登记'},
    {'title':'停车缴费'},
    {'title':'技术服务'},
    {'title':'服务预约'},
    {'title':'活动申报'},
    {'title':'企业展示'},
    {'title':'行业资讯'},
  ];

  final _items = <Widget>[];

  List<Widget> _getServiceItems() {

    for(int i = 0; i<_data.length; i++) {
      var _item = GridItemWidget(
        text: _data[i]['title'],
        functionName: null,
        mid: null,
      );
      _items.add(_item);
    }
    return _items;
  }
}
