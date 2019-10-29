import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/utils/screen_util.dart';

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = ScreenUtil.screenWidth;
    var height = ScreenUtil.screenHeight;
    ScreenUtil.instance = ScreenUtil(width: width, height: height)..init(context);
    return BusinessTestDemo();
  }
}

class BusinessTestDemo extends StatefulWidget {
  @override
  _BusinessTestDemoState createState() => _BusinessTestDemoState();
}

class _BusinessTestDemoState extends State<BusinessTestDemo>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText;
  bool _customIndicator = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  Decoration getIndicator() {
    if (!_customIndicator)
      return const UnderlineTabIndicator();

    switch(_demoStyle) {
      case TabsDemoStyle.iconsAndText:
        return ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.iconsOnly:
        return ShapeDecoration(
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 4.0,
            ),
          ) + const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.textOnly:
        return ShapeDecoration(
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            bottom: TabBar(
              controller: _controller,
              isScrollable: true,
              indicator: getIndicator(),
              tabs: _allPages.map<Tab>((_Page page) {
                assert(_demoStyle != null);
                switch (_demoStyle) {
                  case TabsDemoStyle.iconsAndText:
                    return Tab(text: page.text, icon: Icon(page.icon));
                  case TabsDemoStyle.iconsOnly:
                    return Tab(icon: Icon(page.icon));
                  case TabsDemoStyle.textOnly:
                    return Tab(text: page.text);
                }
                return null;
              }).toList(),
            ),
          ),
          preferredSize: Size.fromHeight(ScreenUtil.screenHeight * 0.12)
      ),
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                key: ObjectKey(page.icon),
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  child: Center(
                    child:_getChildPage(page),
                  ),
                ),
              ),
            );
          }).toList()
      ),
    );
  }

  _getChildPage(_Page page) {
    switch(page.text) {
      case '订单业务':
        return Center(child: Text('订单业务'),);
      case '活动业务':
        return Center(child: Text('活动业务'),);
      case '入驻指南':
        return Center(child: Text('入驻指南'),);
      case '企业规划':
        return Center(child: Text('企业规划'),);
      default:
        break;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly
}

class _Page {
  const _Page({ this.icon, this.text });
  final IconData icon;
  final String text;
}

const List<_Page> _allPages = <_Page>[
  _Page(icon: Icons.grade, text: '订单业务'),
  _Page(icon: Icons.playlist_add, text: '活动业务'),
  _Page(icon: Icons.check_circle, text: '入驻指南'),
  _Page(icon: Icons.question_answer, text: '企业规划'),
];