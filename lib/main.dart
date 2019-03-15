import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/login_page.dart';
import 'package:wanma_huitong/page/home_page.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanma_huitong/common/model/User.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/page/gfz/order_status.dart';

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
                  LoginPage.sName: (context) => LoginPage(),
                  HomePage.sName: (context) => HomePage(),
                  OrderStatus.sName: (context) => OrderStatus(),
                },
                home: LoginPage(),
              );
            }
        ),
    );
  }
}

