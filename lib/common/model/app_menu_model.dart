class AppMenuModel {
  List<Result> result;
  String msg;
  int code;

  AppMenuModel({this.result, this.msg, this.code});

  AppMenuModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }
}

class Result {
  Null addOrgId;
  int authType;
  String menuIcon;
  Null level;
  String module;
  Null mandt;
  String addOrg;
  int pid;
  String title;
  int priority;
  int menu;
  String addDept;
  Null actionKey;
  Null menuKey;
  String action;
  String lmTime;
  int id;
  String lmUser;
  int addDeptId;
  String addTime;
  Null vkorg;
  String addUser;
  int isfunc;

  Result(
      {this.addOrgId,
        this.authType,
        this.menuIcon,
        this.level,
        this.module,
        this.mandt,
        this.addOrg,
        this.pid,
        this.title,
        this.priority,
        this.menu,
        this.addDept,
        this.actionKey,
        this.menuKey,
        this.action,
        this.lmTime,
        this.id,
        this.lmUser,
        this.addDeptId,
        this.addTime,
        this.vkorg,
        this.addUser,
        this.isfunc});

  Result.fromJson(Map<String, dynamic> json) {
    addOrgId = json['add_org_id'];
    authType = json['auth_type'];
    menuIcon = json['menu_icon'];
    level = json['level'];
    module = json['module'];
    mandt = json['mandt'];
    addOrg = json['add_org'];
    pid = json['pid'];
    title = json['title'];
    priority = json['priority'];
    menu = json['menu'];
    addDept = json['add_dept'];
    actionKey = json['action_key'];
    menuKey = json['menu_key'];
    action = json['action'];
    lmTime = json['lm_time'];
    id = json['id'];
    lmUser = json['lm_user'];
    addDeptId = json['add_dept_id'];
    addTime = json['add_time'];
    vkorg = json['vkorg'];
    addUser = json['add_user'];
    isfunc = json['isfunc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_org_id'] = this.addOrgId;
    data['auth_type'] = this.authType;
    data['menu_icon'] = this.menuIcon;
    data['level'] = this.level;
    data['module'] = this.module;
    data['mandt'] = this.mandt;
    data['add_org'] = this.addOrg;
    data['pid'] = this.pid;
    data['title'] = this.title;
    data['priority'] = this.priority;
    data['menu'] = this.menu;
    data['add_dept'] = this.addDept;
    data['action_key'] = this.actionKey;
    data['menu_key'] = this.menuKey;
    data['action'] = this.action;
    data['lm_time'] = this.lmTime;
    data['id'] = this.id;
    data['lm_user'] = this.lmUser;
    data['add_dept_id'] = this.addDeptId;
    data['add_time'] = this.addTime;
    data['vkorg'] = this.vkorg;
    data['add_user'] = this.addUser;
    data['isfunc'] = this.isfunc;
    return data;
  }
}
