class User {
  String userName;
  String password;
  String image;

  User({this.userName,this.password,this.image});

  factory User.fromJson(Map<String,dynamic> json) {
    return User(userName: json['userName'],password: json['password'],image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'userName': userName,'password': password,'image': image};
}

  // 命名构造函数
  User.empty();
}