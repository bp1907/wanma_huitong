import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';

class GridItemWidget extends StatelessWidget {

  final String text;
  final String functionName;

  GridItemWidget({Key key,this.text,this.functionName}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CommonUtils.renderTab(Icons.line_style, text,size: 32.0,color: Colors.deepOrange),
     onTap: () {
        switch(functionName) {
          case 'goHomeWuXi':
            NavigatorUtils.goHomeWuXi(context);
            break;
          case 'goHomeGZ':
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('暂未开通')));
            break;
          case 'goHomeCQ':
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('暂未开通')));
            break;
          case 'goFirstBubbleList':
            NavigatorUtils.goFirstBubbleList(context);
            break;
          case 'goHealthBagList':
            NavigatorUtils.goHealthBagList(context);
            break;
          case 'goSecondBubbleList':
            NavigatorUtils.goSecondBubbleList(context);
            break;
          case 'goPrepressureTankList':
            NavigatorUtils.goPrepressureTankList(context);
            break;
          case 'goPackingDensityList':
            NavigatorUtils.goPackingDensityList(context);
            break;
          default:
            break;
        }
      },
    );
  }
}

//class GridItemWidget extends StatefulWidget {
//  final String text;
//  final String functionName;
//
//  GridItemWidget({this.text,this.functionName});
//
//  @override
//  _GridItemWidgetState createState() => _GridItemWidgetState();
//}
//
//class _GridItemWidgetState extends State<GridItemWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      child: CommonUtils.renderTab(Icons.line_style, widget.text,size: 32.0,color: Colors.deepOrange),
//      onTap: () {
//        switch(widget.functionName) {
//          case 'goHomeWuXi':
//            NavigatorUtils.goHomeWuXi(context);
//            break;
//          case 'goHomeGZ':
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text('暂未开通')));
//            break;
//          case 'goHomeCQ':
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text('暂未开通')));
//            break;
//          default:
//            break;
//        }
//      },
//    );
//  }
//}
