import 'dart:io';
import 'package:app_drawer/models/categorymodel.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class CategoryRepository{
  Future<List<CategoryModel>> getAllCategoryData();
  Future<bool> addCategory(CategoryModel input); 
}


class CategoryService extends CategoryRepository{
  String url = getSubCategories;
  @override
  Future<List<CategoryModel>> getAllCategoryData() async {
    List<CategoryModel> categoryModels = List<CategoryModel>();
    try{
      var response = await http.get(url);
      if(response.statusCode == 200){
        var jsonBody = convert.jsonDecode(response.body);
        var output = jsonBody["rows"];
        if(output != null){
          output.forEach((e){          
            categoryModels.add(CategoryModel.fromJson(e));
          });
        }
        
      }
    }
    catch(e){
      debugPrint(e);
    }
    return categoryModels;
  }

  @override
  Future<bool> addCategory(CategoryModel input) async {
    bool status = false; 
    String url = postCategory;
    var jsoninput = convert.jsonEncode(input);
    try{
    var response = await http.post(url, 
                                   body: jsoninput, 
                                   headers: {
                                     HttpHeaders.contentTypeHeader: "application/json"
                                   });
    if(response.statusCode == 200){
      var jsonBody = response.body;
      var output = convert.jsonDecode(jsonBody);
      var result = output["products"];
      if(result != null){
        status = true;
      }
    }
    }catch(e){
      debugPrint(e);
    }

    return status;
  }

}
