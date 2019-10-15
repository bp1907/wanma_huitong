import 'package:dio/dio.dart';
import 'package:wanma_huitong/common/model/app_menu_model.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';
import 'package:wanma_huitong/common/net/url_constant.dart';
import 'dart:convert';

///获取数据
class DataDao {

  //获取菜单列表数据
  static Future getAppMenu(token, mid, allTag, m) async{

    Map<String, dynamic> requestParams = {
      'token': token,
      'mid': mid,
      'allTag': allTag,
      'm': m
    };

    var res = await HttpManager.netFetch(UrlConstant.getAppMenus(), requestParams, null, Options(method: 'post'));
//    AppMenuModel appMenuModel;
//    if(res != null && res.result) {
//      try{
//        appMenuModel = AppMenuModel.fromJson(json.decode(res.data));
//      }catch(e) {
//      }
//    }
    if(res != null && res.result) {
      return res.data;
    }else {
      return null;
    }
  }

  //获取物联数据
  //[ token] token
  //[ id] id
  //[ gr] gr
  static Future getWLData(token, id, gr) async {

  }
}