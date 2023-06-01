import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venta_casas/src/api/environment.dart';
import 'package:venta_casas/src/models/response_api.dart';
import 'package:venta_casas/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  String _url = Environment.API_VENTA;
  String _api = '/api/users';

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi?> create(User user) async {
    try {
      Uri uri = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(uri, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }

Future<ResponseApi?> login(String email, String password) async{
     try {
      Uri uri = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({
        'email': email,
        'password': password
      });
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(uri, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return null;
    }
}


}
