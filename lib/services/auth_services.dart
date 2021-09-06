import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService{
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

// Register
  Future<UserModel> register({
    String name, 
    String username, 
    String password, 
    String email})
    async{
    String url = '$baseUrl/register';
      var headers = {'Content-Type' : 'application/json'};
      var body = jsonEncode({
        'name' : name,
        'username' : username,
        'email' : email,
        'password' : password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body
    );

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user =  UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    }else{
      throw Exception('Failed to Register');
    }
  }

  // Login
  Future<UserModel> login({
    String password, 
    String email})
    async{
    String url = '$baseUrl/login';
      var headers = {'Content-Type' : 'application/json'};
      var body = jsonEncode({
        'email' : email,
        'password' : password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body
    );

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user =  UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    }else{
      throw Exception('Failed to Login');
    }
  }
}