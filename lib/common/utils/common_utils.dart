import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:wanma_huitong/common/config/config.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/common/redux/theme_data_reducer.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonUtils {

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color,platform: TargetPlatform.android);
  }

  ///store发送action，更新主题
  static pushTheme(Store store,int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData));
  }

  static List<Color> getThemeListColor() {
    return [
      WMColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }
  //加载中
  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: WillPopScope(
            child: Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: SpinKitCubeGrid(color: Color(WMColors.white),),
                    ),
                    Container(height: 10.0,),
                    Container(
                      child: Text('加载中...',style: WMConstant.normalTextWhite,),
                    ),
                  ],
                ),
              ),
            ),
            onWillPop: () => Future.value(true),),
        );
      }
    );
  }

  ///单个底部菜单
  static renderTab(icon, text, {size, color}) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(icon, size: size,color: color,), Text(text,style: TextStyle(fontWeight: FontWeight.bold),)],
      ),
    );
  }
}