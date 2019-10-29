import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanma_huitong/common/dao/data_dao.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/page/app.dart';
import 'package:wanma_huitong/widget/grid_item.dart';

class HomePage extends StatelessWidget {

  final List imageUrls;
  final Future futureStr;

  const HomePage({@required this.imageUrls, @required this.futureStr});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180.0,
          child: Swiper(
            itemCount: imageUrls.length,
            autoplay: true,
            itemBuilder: (BuildContext context, int index){
              return Image.asset(
                imageUrls[index],
                fit: BoxFit.fill,
              );
            },
            pagination: SwiperPagination(),
          ),
        ),
        ItemMenu(futureStr: futureStr,),
      ],
    );
  }
}

class ItemMenu extends StatefulWidget {

  Future futureStr;

  ItemMenu({this.futureStr});

  @override
  _ItemMenuState createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> with AutomaticKeepAliveClientMixin<ItemMenu>{

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: FutureBuilder(
          future: widget.futureStr,
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(semanticsLabel: '加载中...',),);
              case ConnectionState.done:
                if(snapshot.hasError) {
                  return Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
                }else if(snapshot.hasData) {
                  return AreaItem(snapshot.data['result']);
                }else {
                  return Container(height: 300, child: ListView(),);
                }
                break;
              default:
                break;
            }
          },
        ),
        onRefresh: () => _handleRefresh()
    );
  }

  Future _handleRefresh() async {
    String token = await HttpManager.getAuthorization();
    String mid = '0';
    String allTag = '0';
    String m = 'HTAPP';
    setState(() {
      widget.futureStr = DataDao.getAppMenu(token, mid, allTag, m);
    });
  }

  @override
  bool get wantKeepAlive => true;
}


class AreaItem extends StatelessWidget {

  final List data;

  AreaItem(this.data);
//  final AppMenuModel appMenuModel;
//
//  AreaItem(this.appMenuModel);

  final items = <Widget>[];

  _getItem() {
    for(int i = 0;i<data.length;i++) {
      var item = GridItemWidget(
        text: data[i]['title'],
        functionName: 'goHomeWuXi',
        mid: data[i]['id'].toString(),
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        child: GridView(
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 10.0
          ),
          children: _getItem(),
//            GridItemWidget(
//              text: data,
//              functionName: 'goHomeWuXi',
//            ),
//            GridItemWidget(
//              text: '广州',
//              functionName: 'goHomeGZ',
//            ),
//            GridItemWidget(
//              text: '重庆',
//              functionName: 'goHomeCQ',
//            ),
        ),
    );
  }
}