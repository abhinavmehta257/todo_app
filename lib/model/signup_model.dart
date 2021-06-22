import 'dart:convert';

class SignupResponseModel {
  final String user;
  final String error;

  SignupResponseModel({this.user, this.error});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      user: json["user"] != null ? json["user"] : "" ,
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class SignupRequestModel{
  String email;
  String password;
  String name;

  SignupRequestModel({this.email, this.password, this.name});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map ={
      "email": email.trim(),
      "password": password.trim(),
      "name":name.trim(),
    };
  
    return map;
  }

}

