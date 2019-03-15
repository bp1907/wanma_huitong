import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/common/redux/theme_data_reducer.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';

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
    LocalStorage.save('local_theme', index.toString());
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
}