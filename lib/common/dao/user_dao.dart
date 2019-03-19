import 'package:redux/redux.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:wanma_huitong/common/config/config.dart';
import 'package:wanma_huitong/common/dao/result_dao.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';
import 'package:wanma_huitong/common/net/http_manager.dart';

class UserDao {
  static login(userName, password, store) async {
    String type = userName + ':' +password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if(Config.DEBUG) {
      print("base64Str login " + base64Str);
    }
    await LocalStorage.save(Config.USER_NAME_KEY, userName);
    await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

    HttpManager.clearAuthorization();

    var res = await HttpManager.netFetch('', null, null, Options(method: 'post'));
    var resultData = null;
    if(res != null && res.result) {

    }
    return ResultDao(resultData,res.result);
  }
}