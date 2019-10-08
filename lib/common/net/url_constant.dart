///接口地址
class UrlConstant {

  static const String host = 'http://172.18.0.135:9052/';

  ///登陆获取token
  static getToken() {
    return '${host}partner/app/getToken';
  }

  ///获取菜单数据
  static getAppMenus() {
    return '${host}partner/app/getAppMenus';
  }

  ///获取物联数据
  static getData() {
    return '${host}ht/htApp/getWlData';
  }

  ///修改密码
  static updatePwd() {
    return '${host}partner/app/getAppMenus';
  }
}