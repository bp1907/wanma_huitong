import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanma_huitong/common/dao/data_dao.dart';
import 'package:wanma_huitong/common/json/json_string.dart';
import 'package:wanma_huitong/common/model/app_menu_model.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/widget/grid_item.dart';
import 'package:wanma_huitong/widget/home_drawer.dart';
import 'dart:convert';

///主页

class HomePage extends StatefulWidget {
  static final String sName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

//  TabController tabController;

  var _futureStr;

  /// 提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('确定要退出应用？'),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('取消')
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('确定')
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();

    _futureStr = _getAppMenu();
  }

  Future _getAppMenu() async {
//    AppMenuModel appMenuModel;
    String token = await HttpManager.getAuthorization();
    String mid = '0';
    String allTag = '0';
    String m = 'HTAPP';
    var data = await DataDao.getAppMenu(token, mid, allTag, m);
//    if(appMenuModel.code == '0'){
//      return json.decode(JsonString.mockdata);
    return data;
//    }
  }

  @override
  Widget build(BuildContext context) {

  List _imageUrls = [
    'images/gbg.jpg',
    'images/gbg.jpg',
    'images/gbg.jpg',
  ];

  return WillPopScope(
    child: Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('万马会通'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 180.0,
            child: Swiper(
              itemCount: _imageUrls.length,
              autoplay: true,
              itemBuilder: (BuildContext context, int index){
                return Image.asset(
                  _imageUrls[index],
                  fit: BoxFit.fill,
                );
              },
              pagination: SwiperPagination(),
            ),
          ),
      FutureBuilder(
        future: _futureStr,
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(semanticsLabel: '加载中...',),);
            case ConnectionState.done:
              if(snapshot.hasError) {
                return Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
              }else {
                return AreaItem(snapshot.data['result']);
              }
              break;
            default:
              break;
          }
        },
      ),
        ],
      ),
    ),
    onWillPop: () => _dialogExitApp(context),
  );
  }

  @override
  void dispose() {
    // TODO: implement dispose
//    tabController.dispose();
    super.dispose();
  }
}

class AreaItem extends StatelessWidget {

  final List data;

  AreaItem(this.data);
//  final AppMenuModel appMenuModel;
//
//  AreaItem(this.appMenuModel);

  final items = <Widget>[];

  _getItem() {
    for(int i = 0;i<data.length;i++) {
      var item = GridItemWidget(
        text: data[i]['title'],
        functionName: 'goHomeWuXi',
        mid: data[i]['id'].toString(),
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 300.0,
        child: GridView(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            crossAxisSpacing: 10.0
          ),
          children: _getItem(),
//            GridItemWidget(
//              text: data,
//              functionName: 'goHomeWuXi',
//            ),
//            GridItemWidget(
//              text: '广州',
//              functionName: 'goHomeGZ',
//            ),
//            GridItemWidget(
//              text: '重庆',
//              functionName: 'goHomeCQ',
//            ),
        ),
      ),
    );
  }
}