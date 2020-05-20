import 'dart:convert' as convert;
import 'dart:io';
import 'package:app_drawer/models/authmodel.dart';
import 'package:app_drawer/screens/login.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future<bool> authUser(AuthModel input);
}

class AuthServices extends AuthRepository {

  LoginState loginState = LoginState();
  
  @override
  Future<bool> authUser(AuthModel input) async {
    bool result = false;
    String baseurl = authAdminUrl;
    try {
      var response = await http.post(baseurl,
          body: convert.jsonEncode(input),
          headers: {HttpHeaders.contentTypeHeader: "application/json"});
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var output = convert.jsonDecode(jsonBody);
        if (output["status"] == "sucessfull") {
          result = true;
          addUser(output["user_name"]);
        }
      }
    } catch (e) {
      debugPrint(e);
    }
    return result;
  }

  Future<void> addUser(String user_name) async {
    await loginState.storage.write(key: "token2", value: user_name);
  }
}
