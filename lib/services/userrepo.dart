import 'dart:convert' as convert;
import 'package:app_drawer/models/usermodel.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository{
  Future<List<UserModel>> getAllUsers();
}

class UserService extends UserRepository{

  @override
  Future<List<UserModel>> getAllUsers() async {
    String url = getUsers;
    List<UserModel> userModel = List<UserModel>();
    try{
        var response = await http.get(url);
        if (response.statusCode == 200){
          var jsonBody = convert.jsonDecode(response.body);
          var output = jsonBody["users"];
          if(output != null){
          output.forEach((e){          
            userModel.add(UserModel.fromJson(e));
          });
        }       
        }

    }
    catch(e){
      debugPrint(e);
    }
    return userModel;
  }

}