class User {
  String userName;
  String password;

  User({this.userName,this.password});

  factory User.fromJson(Map<String,dynamic> json) {
    return User(userName: json['userName'],password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {userName: userName,password: password};
}

  // 命名构造函数
  User.empty();
}