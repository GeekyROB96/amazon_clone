import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //signup user

  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserModel user = UserModel(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('http://10.10.19.103:3000/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created! Login with Credentials');
          });

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signinUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://10.10.19.103:3000/api/signin'),
        body: jsonEncode({"email": email, 
        "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);

      httpErrorHandle(response: res, context: context, onSuccess: () {

        SharedPreferences  prefs = await SharedPreferences.getInstance();

        prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
      });

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
