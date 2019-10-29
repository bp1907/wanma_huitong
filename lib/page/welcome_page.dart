import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanma_huitong/common/dao/user_dao.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'dart:async';

import 'package:wanma_huitong/common/utils/navigator_utils.dart';

class WelcomePage extends StatefulWidget {

  static final  String sName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool hadInit = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(hadInit) return;
    hadInit = true;
    //防止多次进入
    Store<WMState> store = StoreProvider.of(context);
    Future.delayed(const Duration(seconds: 2), () {
      UserDao.initUserInfo(store).then((res) {
        if(res != null && res.result) {
          NavigatorUtils.goHome(context);
        }else {
          NavigatorUtils.goLogin(context);
        }
        return true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<WMState>(
      builder: (context, store) {
        return Container(
          color: Color(WMColors.white),
          child: Image.asset('images/launch_image.png',),
        );
      },
    );
  }
}
