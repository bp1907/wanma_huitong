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
  final TextEditingController _oldPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _sureNewPwdController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('修改密码',),centerTitle: true,),
      body:SafeArea(
        child: SingleChildScrollView(
        child: Container(
          height:MediaQuery.of(context).size.height-20,
          padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 100),
           decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/login_background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
          child: Column(
          children: <Widget>[
            _oldPwd(context,_oldPwdController),
            _newPwd(context, _newPwdController),
            _sureNewPwd(context, _sureNewPwdController),
            _changeBtn(_oldPwdController.text, _newPwdController.text, _sureNewPwdController.text)
          ],
          ),
        ),
      ) ,
      )
      
    );
  }


Widget _oldPwd (context, controller){
  return _commonTextFieldSet('请输入旧密码',controller);
}

Widget _newPwd (context, controller){
  return _commonTextFieldSet('请输入新密码',controller);
}

Widget _sureNewPwd (context, controller){
  return _commonTextFieldSet('请确认新密码',controller);
}

Widget _commonTextFieldSet(context,TextEditingController editingController){

  return Container(
    padding: EdgeInsets.only(top: 20),
    child:   TextField(

    decoration: InputDecoration(
      icon: Icon(Icons.lock),
      labelText: context,
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 18
      ),
     
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.pink
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      //  focusedBorder: OutlineInputBorder(
      //  borderSide: BorderSide(
      //  color: Colors.pink,
      // ),
      // ),
      // hintText: hintStr
    ),
    obscureText: true,
    controller:editingController,
    onChanged: (values){
      this.setState((){
         editingController.text = values;
      });
    },
    
  ),
  
);
}
Widget _changeBtn (oldPwd,newPwd,surePwd){
  return InkWell(
    onTap: (){
      CommonUtils.showLoadingDialog(context);
      UserDao.updatePwd(oldPwd, newPwd, surePwd).then((res) {
        Navigator.pop(context);
        if(res != null && res.result){
        Future.delayed(const Duration(seconds: 1), () {
        NavigatorUtils.goLogin(context);
        return true;
        });
      }
    });
      print(oldPwd+newPwd+surePwd);
        },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 35),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[600],
          // Theme.of(context).primaryColor
          borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            '确认修改',
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),     
);
}

}