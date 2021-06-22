
import 'dart:io';

import 'package:todo_app/model/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo_app/model/login_model.dart';


class APIService{
  String baseUrl = "https://reqres.in";
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {

    final response = await http.post(Uri.parse(baseUrl+'/api/login'),headers: {HttpHeaders.contentTypeHeader:'application/json'}, body:jsonEncode({"email":requestModel.email,"password":requestModel.password}));

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
      // throw Exception('Failed to load data! responce: ${json.decode(response.body)}');
    }
  }

  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {

    final response = await http.post(Uri.parse(baseUrl+'/auth/signup'),headers: {HttpHeaders.contentTypeHeader:'application/json'}, body:jsonEncode({"email":requestModel.email,"password":requestModel.password, "name":requestModel.name}));

    if (response.statusCode == 200 || response.statusCode == 400) {
      return SignupResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data! responce: ${response}');
    }
  }

  Future authentication(String jwt) async{
    final response = await http.get(Uri.parse(baseUrl+'/dashboard'),headers: {HttpHeaders.contentTypeHeader:'application/json','Authorization':jwt},);
     if (response.statusCode == 200) {
      print(response.body);
    }else if(response.statusCode == 400){
       print(response.body);
    }else {
      throw Exception('Failed to load data! responce: ${response}');
    }
  }

  Future<List> getdata() async{
    var uriResponse;
    List taskList;
      uriResponse = await http.get(Uri.parse('https://reqres.in/api/user?page=2'), headers: {"Accept": "application/json"});
    taskList = jsonDecode(uriResponse.body)['data'];
    if (uriResponse.statusCode == 200){
      return taskList;
    }else {
      throw Exception('Failed to load data! responce: ${uriResponse}');
    }
  }
}  