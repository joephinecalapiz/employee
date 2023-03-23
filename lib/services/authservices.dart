
import 'package:frontend_diaryapp/models/api_response.dart';
import 'package:frontend_diaryapp/services/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';


class AuthServices{

  static Future<http.Response> register(
      String name, String email, String password) async{
    Map data = {
      "name":name,
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse(registerURL);
    // var url = Uri.parse('${baseURL}auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<ApiResponse> login(String email, String password) async{
    ApiResponse apiresponse = ApiResponse();
    Map data = {
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse(loginURL);
    //var url = Uri.parse(baseURL+ 'auth/login');
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if(response.statusCode == 200){
      apiresponse.data = User.fromJson(jsonDecode(response.body));
    }
    print(response.body);
    return apiresponse;
  }

  static Future<http.Response> logout(String email, String password) async{
    Map data = {
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse(logoutURL);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }



}