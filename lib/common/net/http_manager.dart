import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:wanma_huitong/common/config/config.dart';
import 'package:wanma_huitong/common/local/local_storage.dart';
import 'package:wanma_huitong/common/net/code.dart';
import 'package:wanma_huitong/common/net/result_data.dart';
import 'dart:collection';

class HttpManager {

  static const CONTENT_TYPE_JSON = 'application/json';
  static const CONTENT_TYPE_FORM = 'application/x-www-form-urlencoded';

  static Map optionParams = {
    'timeoutMs': 15000,
    'token': null,
    'authorizationCode': null,
  };

  ///发起网络请求
  static netFetch(url, params, Map<String,String> header, Options option, {noTip = false}) async{
    //判断网络
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.none) {
      return ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, '', noTip),
          false, Code.NETWORK_ERROR);
    }

    Map<String, String> headers = HashMap();
    if(header != null) {
      headers.addAll(header);
    }

    if(optionParams['authorizationCode'] == null) {
      var authorizationCode = await getAuthorization();
      if(authorizationCode != null) {
        optionParams['authorizationCode'] = authorizationCode;
      }
    }

    headers['Authorization'] = optionParams['authorizationCode'];

    if(option != null) {
      option.headers = headers;
    }else {
      option = Options(method: 'get');
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = optionParams['timeoutMs'];

    Dio dio = Dio();
    Response response;
    try{
      response = await dio.request(url,data: params,options: option);
    }on DioError catch(e) {
      Response errorResponse;
      if(e.response != null) {
        errorResponse = e.response;
      }else {
        errorResponse = Response(statusCode: 111);
      }
      if(e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if(Config.DEBUG){
        print('请求异常：' + e.toString());
        print('请求异常url：' + url);
      }
      return ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),false,errorResponse.statusCode);
    }

    //调试模式
    if (Config.DEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
      if (optionParams["authorizationCode"] != null) {
        print('authorizationCode: ' + optionParams["authorizationCode"]);
      }
    }

    try{
      if(option.contentType != null && option.contentType.primaryType == 'text') {
        return ResultData(response.data, true, Code.SUCCESS);
      }else {
        var responseJson = response.data;
        //请求已创建
        if(response.statusCode == 201 && responseJson['token'] != null) {
          optionParams['authorizationCode'] = 'token ' + responseJson['token'];
          await LocalStorage.save(Config.TOKEN_KEY, optionParams['authorizationCode']);
        }
      }

      if(response.statusCode == 200 || response.statusCode == 201) {
        return ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    }catch(e) {
      print(e.toString() + url);
      return ResultData(response.data, false, response.statusCode,headers: response.headers);
    }

    return ResultData(Code.errorHandleFunction(response.statusCode, '', noTip), false, response.statusCode);
  }

  ///清除授权
  static clearAuthorization() {
    optionParams['authorizationCode'] = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

///获取授权token
static getAuthorization() async{
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if(token == null) {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if(basic == null) {
        //提示输入账号密码
      }else {
        //通过basic获取token
        return 'Basic $basic';
      }
    }else {
      optionParams['authorizationCode'] = token;
      return token;
    }
}
}