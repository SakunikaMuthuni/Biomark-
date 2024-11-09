class UserModel{
  String user_email;
  String user_password;

  UserModel(this.user_email, this.user_password);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'user_email': user_email,
      'user_password': user_password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : user_email = map['user_email'],
        user_password = map['user_password'];
}

