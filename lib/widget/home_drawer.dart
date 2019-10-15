import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/config/config.dart';
import 'package:wanma_huitong/common/dao/user_dao.dart';
import 'package:wanma_huitong/common/db/base_db_manager.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';
import 'package:wanma_huitong/common/utils/screen_util.dart';

class HomeDrawer extends StatelessWidget {

  //关于
  showAboutDialog(BuildContext context, String versionName) {
    versionName ??= 'null';
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text('当前版本：$versionName'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('确定'),),
        ],
      ),
    );
  }

  //主题切换
  showThemeDialog(BuildContext context,Store store) {
    List<String> listStr = [
      '默认主题',
      '主题一',
      '主题二',
      '主题三',
      '主题四',
      '主题五',
      '主题六',
    ];
    List<Color> listColor = CommonUtils.getThemeListColor();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: 250.0,
              height: 400.0,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(WMColors.white),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ListView.builder(
                itemCount: listStr.length,
                itemBuilder: (context,index) {
                  return RaisedButton(
                    padding: new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                    textColor: Colors.white,
                    color: listColor != null ? listColor[index] : Theme.of(context).primaryColor,
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.start,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Text(listStr[index],style: TextStyle(fontSize: 14.0,),maxLines: 2,),
                      ],
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                      CommonUtils.pushTheme(store, index);
                      LocalStorage.save(Config.THEME_COLOR, index.toString());
                    },
                  );
                },
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreBuilder<WMState>(
        builder: (context,store){
          return Drawer(
            //侧边栏按钮
            child: Container(
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Material(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: ScreenUtil().setHeight(380),
                          child: UserAccountsDrawerHeader(
                            accountName: Container(
                              child: Text('王振',style: WMConstant.lagerTextWhite,),
                            ),
                            accountEmail: Text('流程与IT中心', style: WMConstant.middleTextWhite,),
                            currentAccountPicture: GestureDetector(
                              onTap: (){},
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/logo.png'),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('设置参数', style: WMConstant.normalText,),
                          onTap: (){
                            //TODO
                          },
                        ),
                        ListTile(
                          title: Text('修改密码', style: WMConstant.normalText,),
                          onTap: (){
                            NavigatorUtils.goUpdatePwd(context);
                          },
                        ),
                        ListTile(
                          title: Text('切换主题', style: WMConstant.normalText,),
                          onTap: (){
                            showThemeDialog(context,store);
                          },
                        ),
                        ListTile(
                          title: Text('问题反馈', style: WMConstant.normalText,),
                          onTap: (){
                            //TODO
                          },
                        ),
                        ListTile(
                          title: Text('检测更新', style: WMConstant.normalText,),
                          onTap: (){
                            //TODO
                          },
                        ),
                        ListTile(
                          title: RaisedButton(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                            textColor: Color(WMColors.textWhite),
                            color: Colors.redAccent,
                            child: Flex(
                              mainAxisAlignment: MainAxisAlignment.center,
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Text('退出登录',style: TextStyle(fontSize: 20.0),maxLines: 1,),
                              ],
                            ),
                            onPressed: (){
                              UserDao.clearAll(store);
                              BaseDbManager.close();
                              NavigatorUtils.goLogin(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}