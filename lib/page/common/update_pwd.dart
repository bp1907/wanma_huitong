import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanma_huitong/common/dao/user_dao.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';

class UpdatePwd extends StatefulWidget {
  @override
  _UpdatePwdState createState() => _UpdatePwdState();
}

class _UpdatePwdState extends State<UpdatePwd> {
  var _oldPwd = '';
  var _newPwd = '';
  var _sureNewPwd = '';
  final TextEditingController oldPwdController = TextEditingController();
  final TextEditingController newPwdController = TextEditingController();
  final TextEditingController sureNewPwdController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    oldPwdController.value = TextEditingValue(text: _oldPwd);
    newPwdController.value = TextEditingValue(text: _newPwd);
    sureNewPwdController.value = TextEditingValue(text: _sureNewPwd);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('修改密码'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0),
              child: Column(
                children: <Widget>[
                  Padding(padding: new EdgeInsets.all(30.0)),
                  TextField(
                    decoration: InputDecoration(
                      hintText:'请输入旧密码',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onChanged: (String value){
                      _oldPwd = value;
                    },
                    controller: oldPwdController,
                  ),
                  Padding(padding: new EdgeInsets.all(30.0)),
                  TextField(
                    decoration: InputDecoration(
                      hintText:'请输入新密码',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onChanged: (String value){
                      _newPwd = value;
                    },
                    controller: newPwdController,
                  ),
                  Padding(padding: new EdgeInsets.all(30.0)),
                  TextField(
                    decoration: InputDecoration(
                      hintText:'请确认新密码',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onChanged: (String value){
                      _sureNewPwd = value;
                    },
                    controller: sureNewPwdController,
                  ),
                  Padding(padding: new EdgeInsets.all(30.0)),
                  RaisedButton(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Text('确认修改',style: TextStyle(fontSize: 20.0),maxLines: 1,),
                      ],
                    ),
                    onPressed: (){
                      if(_oldPwd == null || _oldPwd.length == 0) {
                        Fluttertoast.showToast(msg: '请输入旧密码');
                        return;
                      }
                      if(_newPwd == null || _newPwd.length == 0) {
                        Fluttertoast.showToast(msg: '请输入新密码');
                        return;
                      }
                      if(_sureNewPwd == null || _sureNewPwd.length == 0) {
                        Fluttertoast.showToast(msg: '请确认新密码');
                        return;
                      }
                      CommonUtils.showLoadingDialog(context);
                      UserDao.updatePwd(_oldPwd, _newPwd, _sureNewPwd).then((res) {
                        Navigator.pop(context);
                        if(res != null && res.result){
                          Future.delayed(const Duration(seconds: 1), () {
                            NavigatorUtils.goLogin(context);
                            return true;
                          });
                        }
                      });
                    },
                  ),
                  Padding(padding: new EdgeInsets.all(30.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
