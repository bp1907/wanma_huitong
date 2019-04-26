import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/dao/user_dao.dart';
import 'package:wanma_huitong/common/event/http_error_event.dart';
import 'package:wanma_huitong/common/net/code.dart';
import 'package:wanma_huitong/page/login_page.dart';
import 'package:wanma_huitong/page/home_page.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanma_huitong/common/model/User.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_list.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/health_bag_list.dart';
import 'package:wanma_huitong/page/wuxi/pack/packing_density_list.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/prepressure_tank_list.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_list.dart';
import 'package:wanma_huitong/page/wuxi/wx_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  /// 创建Store，引用 WMState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = Store<WMState>(
    appReducer,
    ///初始化数据
    initialState: WMState(
      userInfo: User.empty(),
      themeData: CommonUtils.getThemeData(WMColors.primarySwatch),
    )
  );
  
  MyApp({Key key}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    /// 通过 StoreProvider 应用 store
    return StoreProvider(
        store: store,
        child: StoreBuilder<WMState>(
            builder: (context, store) {
              return MaterialApp(
                title: '万马会通',
                theme: store.state.themeData,
                routes: {
                  LoginPage.sName: (context) => CommonLayer(child: LoginPage(),),
                  HomePage.sName: (context) => CommonLayer(child: HomePage(),),
                  WXHomePage.sName: (context) => CommonLayer(child: WXHomePage(),),
                  FirstBubbleList.sName: (context) => CommonLayer(child: FirstBubbleList(),),
                  HealthBagList.sName: (context) => CommonLayer(child: HealthBagList(),),
                  SecondBubbleList.sName: (context) => CommonLayer(child: SecondBubbleList()),
                  PrepressureTankList.sName: (context) => CommonLayer(child: PrepressureTankList(),),
                  PackingDensityList.sName: (context) => CommonLayer(child: PackingDensityList(),)
//                  FirstBubbleDetail.sName: (context) => CommonLayer(child: FirstBubbleDetail(),),
//                  FirstBubbleCurve.sName: (context) => CommonLayer(child: FirstBubbleCurve(),),
                },
                home: CommonLayer(
                  child: LoginPage(),
                ),
              );
            }
        ),
    );
  }
}

class CommonLayer extends StatefulWidget {
  final Widget child;

  CommonLayer({this.child});

  @override
  _CommonLayerState createState() => _CommonLayerState();
}

class _CommonLayerState extends State<CommonLayer> {

  StreamSubscription stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //stream控制eventbus的使用
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if(stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(msg: '网络错误');
        break;
      case Code.NETWORK_TIMEOUT:
        Fluttertoast.showToast(msg: '请求超时');
        break;
      case 401:
        Fluttertoast.showToast(msg: '[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]');
        break;
      case 403:
        Fluttertoast.showToast(msg: '403错误');
        break;
      case 404:
        Fluttertoast.showToast(msg: '404错误');
        break;
      default:
        Fluttertoast.showToast(msg: '其他异常 ' + message);
        break;
    }
  }
}


