class LoginResponseModel {
  final String apiKey;
  final String error;

  LoginResponseModel({this.apiKey, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      apiKey: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel{
  String email;
  String password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map ={
      "email": email.trim(),
      "password": password.trim(),
    };
  
    return map;
  }

}

