import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';
import 'package:wanma_huitong/widget/home_drawer.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';

///主页

class HomePage extends StatefulWidget {
  static final String sName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

//  TabController tabController;

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
    // TODO: implement initState
    super.initState();
//    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

//    List<Widget> tabs = [
////      _renderTab(Icons.store, '工业4.0'),
////      _renderTab(Icons.business, '业务'),
////      _renderTab(Icons.devices_other, '其他'),
////    ];

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
              AreaItem(),
            ],
        )/*TabBarView(
          children: <Widget>[
            FactorPage(),//工业4.0
            BusinessPage(),//业务
            OtherPage(),//其他
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
        )*/,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 30.0,
        crossAxisCount: 3,
        children: <Widget>[
          _renderTab(Icons.line_style, '无锡新区',size: 32.0,color: Colors.deepOrange),
          _renderTab(Icons.linear_scale, '广州',size: 32.0,color: Colors.deepOrange),
          _renderTab(Icons.linear_scale, '重庆',size: 32.0,color: Colors.deepOrange),
        ],
      ),
    );
  }
}



//单个底部菜单
_renderTab(icon, text, {size, color}) {
  return Tab(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(icon, size: size,color: color,), Text(text,style: TextStyle(fontWeight: FontWeight.bold),)],
    ),
  );
}


//工业4.0页面
class FactorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 30.0,
      crossAxisCount: 3,
      children: <Widget>[
        _renderTab(Icons.line_style, '生产线列表',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.linear_scale, '历史运行曲线',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.linear_scale, '生产线运行日志',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.devices, '异常查询',size: 32.0,color: Colors.deepOrange),
      ],
    );
  }
}

//业务页面
class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 30.0,
      crossAxisCount: 3,
      children: <Widget>[
        InkWell(
          child: _renderTab(Icons.store, '订单状态',size: 32.0,color: Colors.deepOrange),
          onTap: (){
            NavigatorUtils.goGfzOrderStatus(context);
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text('暂未开通')));
          },
        ),

        _renderTab(Icons.store, '应收货款',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '货款回笼',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '开票情况',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '基准价',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '目标情况',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '发出情况',size: 32.0,color: Colors.deepOrange),
        _renderTab(Icons.store, '发货跟踪',size: 32.0,color: Colors.deepOrange),
      ],
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('其他'),
    );
  }
}