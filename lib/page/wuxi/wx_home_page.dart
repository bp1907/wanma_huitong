import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/page/wuxi/extrusion/home_extrusion.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/home_fist_bubble.dart';
import 'package:wanma_huitong/page/wuxi/pack/home_pack.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/home_second_bubble.dart';

class WXHomePage extends StatefulWidget {

  static final String sName = 'wx_home';

  @override
  _WXHomePageState createState() => _WXHomePageState();
}

class _WXHomePageState extends State<WXHomePage> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [
      CommonUtils.renderTab(Icons.store, '一次发泡'),
      CommonUtils.renderTab(Icons.store, '二次发泡'),
      CommonUtils.renderTab(Icons.table_chart, '打包'),
      CommonUtils.renderTab(Icons.devices_other, '挤出'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('无锡新区'),
      ),
      body: TabBarView(
        children: <Widget> [
          HomeFirstBubble(),
          HomeSecondBubble(),
          HomePack(),
          HomeExtrusion(),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          tabs: tabs,
          controller: tabController,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
}

