import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/dao/data_dao.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';
import 'package:wanma_huitong/page/wuxi/extrusion/home_extrusion.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';
import 'package:wanma_huitong/page/wuxi/pack/home_pack.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_curve.dart';
import 'package:wanma_huitong/widget/grid_item.dart';

class WXHomePage extends StatefulWidget {

  static final String sName = 'wx_home';

  final String mid;

  WXHomePage(this.mid);

  @override
  _WXHomePageState createState() => _WXHomePageState();
}

class _WXHomePageState extends State<WXHomePage> {

  var _futureStr;

  Future _getWXItem() async {
    String token = await HttpManager.getAuthorization();
    String mid = widget.mid;
    String allTag = '0';
    String m = 'HTAPP';
    var data = await DataDao.getAppMenu(token, mid, allTag, m);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _futureStr = _getWXItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureStr,
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(semanticsLabel: '加载中...',),);
          case ConnectionState.done:
            if(snapshot.hasError) {
              return Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
            }else {
              return WXHomeItem(snapshot.data['result']);
            }
            break;
          default:
            break;
        }
      },
    );
  }
}

class WXHomeItem extends StatefulWidget {

  final List data;

  WXHomeItem(this.data);

  @override
  _WXHomeItemState createState() => _WXHomeItemState();
}

class _WXHomeItemState extends State<WXHomeItem>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var items = <Widget>[];

  _getItem() {
    for(int i = 0;i<widget.data.length;i++) {
      var item = GridItemWidget(
        text: widget.data[i]['title'],
        functionName: 'goFirstBubbleList',
        mid: widget.data[i]['id'].toString(),
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('无锡新区'),
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 30.0,
          crossAxisCount: 3,
          children: _getItem(),
//          children: <Widget>[
//            GridItemWidget(
//              text: '一次发泡',
//              functionName: 'goFirstBubbleList',
//            ),
//            GridItemWidget(
//              text: '养生袋',
//              functionName: 'goHealthBagList',
//            ),
//            GridItemWidget(
//              text: '二次发泡',
//              functionName: 'goSecondBubbleList',
//            ),
//            GridItemWidget(
//              text: '预压罐',
//              functionName: 'goPrepressureTankList',
//            ),
//            GridItemWidget(
//              text: '打包',
//              functionName: 'goPackingDensityList',
//            ),
//          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

