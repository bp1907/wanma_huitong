import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanma_huitong/common/dao/data_dao.dart';
import 'package:wanma_huitong/common/json/json_string.dart';
import 'package:wanma_huitong/common/model/app_menu_model.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/page/business_page.dart';
import 'package:wanma_huitong/page/home_page.dart';
import 'package:wanma_huitong/page/my_page.dart';
import 'package:wanma_huitong/page/service_page.dart';
import 'package:wanma_huitong/widget/grid_item.dart';
import 'package:wanma_huitong/widget/home_drawer.dart';
import 'dart:convert';

///主页

class App extends StatefulWidget {
  static final String sName = 'home';
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin{

  var _currentIndex = 0;

  PageController _pageController;

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
    _pageController = PageController(initialPage: _currentIndex);
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

  List<Widget> _pageList = [
    HomePage(imageUrls: _imageUrls, futureStr: _futureStr,),
    ServicePage(),
    BusinessPage(),
    MyPage(),
  ];

  return WillPopScope(
    child: Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('万马会通'),
      ),
      body: PageView(
        controller: _pageController,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('服务'),
            icon: Icon(Icons.stars),
          ),
          BottomNavigationBarItem(
            title: Text('业务'),
            icon: Icon(Icons.business),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: Icon(Icons.person),
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
