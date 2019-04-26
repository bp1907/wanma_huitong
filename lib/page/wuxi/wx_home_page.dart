import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/utils/common_utils.dart';
import 'package:wanma_huitong/common/utils/navigator_utils.dart';
import 'package:wanma_huitong/page/wuxi/extrusion/home_extrusion.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';
import 'package:wanma_huitong/page/wuxi/pack/home_pack.dart';
import 'package:wanma_huitong/page/wuxi/second_bubble/second_bubble_curve.dart';
import 'package:wanma_huitong/widget/grid_item.dart';

class WXHomePage extends StatefulWidget {

  static final String sName = 'wx_home';

  @override
  _WXHomePageState createState() => _WXHomePageState();
}

class _WXHomePageState extends State<WXHomePage>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('无锡新区'),
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 30.0,
          crossAxisCount: 3,
          children: <Widget>[
            GridItemWidget(
              text: '一次发泡',
              functionName: 'goFirstBubbleList',
            ),
            GridItemWidget(
              text: '养生袋',
              functionName: 'goHealthBagList',
            ),
            GridItemWidget(
              text: '二次发泡',
              functionName: 'goSecondBubbleList',
            ),
            GridItemWidget(
              text: '预压罐',
              functionName: 'goPrepressureTankList',
            ),
            GridItemWidget(
              text: '打包',
              functionName: 'goPackingDensityList',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

