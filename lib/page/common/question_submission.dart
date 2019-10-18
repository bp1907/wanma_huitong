import 'package:flutter/material.dart';

class QuestionSubmission extends StatefulWidget {
  @override
  _QuestionSubmissionState createState() => _QuestionSubmissionState();
}

class _QuestionSubmissionState extends State<QuestionSubmission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('问题反馈'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
          child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.mode_edit,color: Colors.blue,),
              Text('反馈意见')
            ],),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: TextField(
          maxLines: 10,
          decoration: InputDecoration(
            labelText: '请输入您宝贵的意见或建议。（800字以内）',
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
          ), 
        ),   
            ),
            Text('欢迎您为我们提出宝贵的意见和建议，您留下的任何信息都将用来改善我们的软件。',style: TextStyle(color: Colors.grey),),
           InkWell(
             child: Container(
               margin: EdgeInsets.only(top: 30),
               padding: EdgeInsets.all(10.0),
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Text(
                 '提交',
                 style: TextStyle(color: Colors.white,fontSize: 18),
               ),
             ),
             onTap: (){

             },
           )
            
          ],
        ),
        )
        )
      ),
    );
  }
}