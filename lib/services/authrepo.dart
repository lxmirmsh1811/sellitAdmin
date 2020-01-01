import 'dart:convert' as convert;
import 'dart:io';
import 'package:app_drawer/models/authmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository{
  Future<bool> authUser(AuthModel input);
}
class AuthServices extends AuthRepository{
  @override
  Future<bool> authUser(AuthModel input) async {
    bool result = false;
    String baseurl = "http://3.134.103.215:3000/api/v1/auth/admin";
    try{
      var response = await http.post(baseurl,
                                     body: convert.jsonEncode(input),
                                     headers: {
                                       HttpHeaders.contentTypeHeader: "application/json"
                                     });
      if(response.statusCode == 200){
        var jsonBody = response.body;
        var output = convert.jsonDecode(jsonBody);
        if(output["status"] == "sucessfull"){
          result = true;
        }
        

      }
    }catch(e){
      debugPrint(e);
    }
    return result;
  }
  
}