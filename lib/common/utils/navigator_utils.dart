import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanma_huitong/page/app.dart';
import 'package:wanma_huitong/page/common/update_pwd.dart';
import 'package:wanma_huitong/page/login_page.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_list.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/health_bag_list.dart';
import 'package:wanma_huitong/page/wuxi/pack/packing_density_list.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/prepressure_tank_list.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_list.dart';
import 'package:wanma_huitong/page/wuxi/wx_home_page.dart';
import 'package:wanma_huitong/page/common/question_submission.dart';
import 'package:wanma_huitong/page/common/version_update.dart';
///导航栏
class NavigatorUtils {

  ///登录页
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }
  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, App.sName);
  }

  ///无锡新区
  ///主页
  static goHomeWuXi(BuildContext context, String mid) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WXHomePage(mid),
      ),
    );
  }

  ///一次发泡
  ///生产线列表
  static goFirstBubbleList(BuildContext context, String mid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirstBubbleList(mid),
      ),
    );
  }

  ///养生袋清单
  static goHealthBagList(BuildContext context) {
    Navigator.pushNamed(context, HealthBagList.sName);
  }

  ///二次发泡清单
  static goSecondBubbleList(BuildContext context) {
    Navigator.pushNamed(context, SecondBubbleList.sName);
  }

  ///预压罐清单
  static goPrepressureTankList(BuildContext context) {
    Navigator.pushNamed(context, PrepressureTankList.sName);
  }

  ///打包密度清单
  static goPackingDensityList(BuildContext context) {
    Navigator.pushNamed(context, PackingDensityList.sName);
  }


  ///通用
  ///修改密码
  static goUpdatePwd(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdatePwd(),
      ),
    );
  }
//问题反馈
static goQuestionSubmission(BuildContext context){
  Navigator.push(context, 
  MaterialPageRoute(
    builder: (context)=> QuestionSubmission(),
  )
  );
}

//版本更新
static goVersionUpdate(BuildContext context){
  Navigator.push(context, 
  MaterialPageRoute(
    builder: (context)=> VersionUpdate(),
  ));
}



//  static NavigatorRouter(BuildContext context,Widget widget) {
//    return Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
//  }
}