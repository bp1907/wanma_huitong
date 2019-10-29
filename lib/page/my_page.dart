import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanma_huitong/common/config/config.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';
import 'package:wanma_huitong/common/model/User.dart';
import 'package:wanma_huitong/common/redux/user_reducer.dart';
import 'package:wanma_huitong/common/redux/wm_state.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';
import 'package:wanma_huitong/common/utils/screen_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatelessWidget {


  final List<String> midStrings = ['会员中心', '我的任务', '我的社区'];

  final List<IconData> midIcons = [
    Icons.person,
    Icons.list,
    Icons.shop,
  ];


  final List<String> btmStrings = ['服务电话', '关于社区'];

  final List<IconData> btmIcons = [Icons.call, Icons.error];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              UserInfoDrawer(),
              MyOrderUI(),
              CashState(),
              list(),
            ],
          ),
        ),
      ),
    );
  }

  Widget list() {
    try {
      return Column(
        children: <Widget>[
          MyDivider(
            height: ScreenUtil().setHeight(20),
            color: Color.fromARGB(255, 240, 238, 238),
          ),
          LoveUI(
            names: midStrings,
            icons: midIcons,
          ),
          MyDivider(
            height: ScreenUtil().setHeight(20),
            color: Color.fromARGB(255, 240, 238, 238),
          ),
          LoveUI(
            names: btmStrings,
            icons: btmIcons,
          ),
          MyDivider(
            height: ScreenUtil().setHeight(20),
            color: Color.fromARGB(255, 240, 238, 238),
          ),
        ],
      );
    } catch (e) {
      print(e);
      return Center(
        child: Container(
          child: Text('加载出错...', style: WMConstant.normalTextLight,),
        ),
      );
    }
  }
}

//顶部用户信息
class UserInfoDrawer extends StatefulWidget {
  @override
  _UserInfoDrawerState createState() => _UserInfoDrawerState();
}

class _UserInfoDrawerState extends State<UserInfoDrawer> with AutomaticKeepAliveClientMixin<UserInfoDrawer>{

  File _image;
  File _backgroundImage;

  //我的页面头像
  Future getImage(isTakePic) async {
    var image = await ImagePicker.pickImage(source: isTakePic ? ImageSource.camera : ImageSource.gallery);
    Store<WMState> store = StoreProvider.of(context);
    User user = User();
    user.userName = store.state.userInfo.userName;
    user.password = store.state.userInfo.password;
    user.image = image.path;

    //保存image地址，下次进来直接取,只做了本地保存
    await LocalStorage.save(Config.AVATAR, image.path);

    store.dispatch(UpdateUserAction(user));
    setState(() {
      _image = image;
    });
  }

  //我的页面背景图片
  Future getBackgroundImage(isTakePic) async {
    var image = await ImagePicker.pickImage(source: isTakePic ? ImageSource.camera : ImageSource.gallery);

    //只做了本地保存
    await LocalStorage.save(Config.BACKGROUND_MY, image.path);

    setState(() {
      _backgroundImage = image;
    });
  }


  @override
  void initState() {
    super.initState();
    getBackGroundImg();
  }

  void getBackGroundImg() async{
    var backGroundImg = await LocalStorage.get(Config.BACKGROUND_MY);
    if(backGroundImg != null) {
      setState(() {
        _backgroundImage = File(backGroundImg);
      });
    }
  }

  _pickImage(flag) {
    showModalBottomSheet(context: context, builder: (context) => Container(
      height: 160,
      child: Column(
        children: <Widget>[
          item('拍照', true, flag),
          item('从相册选择', false, flag),
        ],
      ),
    )
    );
  }

  item(title, isTakePic, flag) {
    return ListTile(
      leading: Icon(isTakePic ? Icons.photo_camera : Icons.photo_library),
      title: Text(title),
      onTap: () {
        if(flag) {
          getImage(isTakePic);
        }else {
          getBackgroundImage(isTakePic);
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<WMState>(
      builder: (context, store) {
        return GestureDetector(
          onTap: () {
            _pickImage(false);
          },
          child: Container(
            height: ScreenUtil().setHeight(350),
            child: UserAccountsDrawerHeader(
              accountName: Text('王振', style: WMConstant.lagerTextWhite,),
              accountEmail: Text('流程与IT中心', style: WMConstant.middleTextWhite,),
              currentAccountPicture: Container(
                child: InkWell(
                    child: CircleAvatar(
                      backgroundImage: _image == null ? AssetImage(store.state.userInfo.image ?? 'images/logo.png') : FileImage(_image),
                    ),
                    onTap: () {
                      //点击换头像
                      _pickImage(true);
                    }
                ),
                width: ScreenUtil().setWidth(20),
                height: ScreenUtil().setHeight(20),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _backgroundImage == null ? AssetImage('images/bg_person.jpg') :FileImage(_backgroundImage) ,
                ),
              ),
            ),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

}

class MyOrderUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(50),
                  child: Icon(Icons.reorder),
                ),
                Container(
                  child: Text('我的中心'),
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
          ),
        ],
      ),
    );
  }
}

//我的订单项
class CashState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          orderItem(Icon(Icons.monetization_on), '余额'),
          orderItem(Icon(Icons.format_list_numbered), '积分'),
          orderItem(Icon(Icons.cast), '消费券'),
          orderItem(Icon(Icons.library_add), '评价'),
        ],
      ),
    );
  }
}

//我的订单下单项
Widget orderItem(Icon icon, String content) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
            width: ScreenUtil().setWidth(55),
            height: ScreenUtil().setHeight(55),
            child: icon
        ),
        Container(
          child: Text(content),
        ),
      ],
    ),
  );
}

//每一列的项
class LoveUI extends StatelessWidget {
  final List<String> names;
  final List<IconData> icons;

  LoveUI({Key key, @required this.names, @required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: names.length == 3
          ? ScreenUtil().setHeight(270)
          : ScreenUtil().setHeight(180),
      child: ListView.builder(
        itemBuilder: _getListUi,
        itemCount: names.length,
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }


  Widget _getListUi(BuildContext context, int index) {
    return Container(
      child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: Icon(
                      icons[index],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(names[index]),
                  ),
                ],
              ),
              Container(
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(30),
                  margin: EdgeInsets.only(right: 10.0),
                  alignment: Alignment.center,
                  child: Icon(Icons.keyboard_arrow_right, color: Colors.grey,)
              ),
            ],
          ),
          onTap: () async {
            if(names[index] == '服务电话') {
              callPhone(context);
            }else if(names[index] == '会员中心') {
//              NavigatorUtil.push(context, LoginApp());
            }
          }),
    );
  }

  callPhone(BuildContext context) {
    var phoneNum = 'tel:' + Config.PHONE_NUM;
    showAlert(context, '是否拨打技术人员电话？', phoneNum);
  }

  showAlert(context, msg, url) {
    if(Platform.isIOS) {
      makePhoneCall(url);
    }else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(msg),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  makePhoneCall(url);
                  Navigator.pop(context);
                },
                child: Text('确定'),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('取消'),
              ),
            ],
          );
        }
      );
    }
  }

  makePhoneCall(url) async{
    if(await canLaunch(url)) {
      await launch(url);
    }else {
      throw 'Could not launch $url';
    }
  }
}

///触摸回调组件
class TouchCallBack extends StatefulWidget {

  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onPressed;
  final bool isFeed;
  //背景色
  final Color background;

  TouchCallBack({
    @required this.child,
    @required this.onPressed,
    this.isFeed : true,
    this.background : const Color(0xffd8d8d8),
  });

  @override
  _TouchCallBackState createState() => _TouchCallBackState();
}

class _TouchCallBackState extends State<TouchCallBack> {

  Color color =  Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        if(widget.isFeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}

class MyDivider extends StatelessWidget {
  final Color color;

  final double height;

  MyDivider({Key key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: height,
      color: color,
    );
  }
}
