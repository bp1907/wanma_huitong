import 'package:flutter/material.dart';
import 'package:wanma_huitong/common/dao/data_dao.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/page/wuxi/first_bubble/first_bubble_detail.dart';

class FirstBubbleList extends StatefulWidget {

  static final String sName = 'first_bubble_list';

  final String mid;

  FirstBubbleList(this.mid);

  @override
  _FirstBubbleListState createState() => _FirstBubbleListState();
}

class _FirstBubbleListState extends State<FirstBubbleList> {

  var _futureStr;

  Future _getWXItem() async {
    String token = await HttpManager.getAuthorization();
    String mid = widget.mid;
    String allTag = '0';
    String m = 'HTAPP';
    var data = await DataDao.getAppMenu(token, mid, allTag, m);
    return data;
  }

  @override
  void initState() {
    _futureStr = _getWXItem();
  }

  List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('一次发泡'),
      ),
      body: FutureBuilder(
        future: _futureStr,
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(semanticsLabel: '加载中...',),);
            case ConnectionState.done:
              if(snapshot.hasError) {
                return Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
              }else {
                return ListView.builder(
                  itemCount: (snapshot.data['result'] as List).length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text((snapshot.data['result'] as List)[index]['title']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FirstBubbleDetail()),);
                          },
                        ),
                        Divider(height: 2.0,),
                      ],
                    );
                  },
                );
              }
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
