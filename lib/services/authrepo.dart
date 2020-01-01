import 'dart:convert' as convert;
import 'dart:io';
import 'package:app_drawer/models/authmodel.dart';
//import 'package:app_drawer/models/authresponsemodel.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future<bool> authUser(AuthModel input);
  Future<String> getUser(AuthModel input);
}

class AuthServices extends AuthRepository {
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
        }
      }
    } catch (e) {
      debugPrint(e);
    }
    return result;
  }

  @override
  Future<String> getUser(AuthModel input) async {
    String baseurl = authAdminUrl;
    String result = "";
    try {
      var response = await http.post(baseurl,
          body: convert.jsonEncode(input),
          headers: {HttpHeaders.contentTypeHeader: "application/json"});
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var output = convert.jsonDecode(jsonBody);
        if (output["user_name"] != null) {
          result = output["user_name"];
        }
      }
    } catch (e) {
      debugPrint(e);
    }
    return result;
  }
}
