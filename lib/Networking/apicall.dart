import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

String Url = 'http://68.178.165.76:8081';

class APICALL {
  static Future<void> login(String username, String password) async {
    print('heyy');
    http.Response response = await http.post(
      Uri.parse('http://68.178.165.76:8081/v1/login'),
      body: jsonEncode({"username": username, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
  }
}
