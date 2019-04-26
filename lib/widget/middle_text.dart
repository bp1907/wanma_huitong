import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/style/wm_style.dart';

class MiddleText extends StatelessWidget {
  
  final String text;
  final bool flag;

  MiddleText(this.text,{this.flag = true});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
      decoration: flag ? BoxDecoration(
//        color: Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 1.0
        )
      ) : null,
      child: Text(
        text,
        style: WMConstant.middleText,
      ),
    );
  }
}
