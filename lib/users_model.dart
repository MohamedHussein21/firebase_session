class UserModel {
  String? name;
  String? email;
  String? password;
  String? uId;

  UserModel({ this.uId,  this.name,  this.email,  this.password});

  factory UserModel.fromJson (Map<String,dynamic> json){
    return UserModel(
      uId: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String,dynamic> toMap () {
    return {
      'name' : name,
      'uId' : uId,
      'email' : email,
      'password' : password,
    };
  }
}