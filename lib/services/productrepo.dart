import 'dart:io';

import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/models/productstatusmodel.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ProductRepository{

  Future<List<ProductModel>> getProductsByStatus(String status);
  Future<bool> postStatus(ProductStatusModel input);
}

// 'Approved': 1,
// 'Sold': 2,
// 'Under_Review': 3,
// "Inactive": 4,
// "Deleted" : 5

class ProductService extends ProductRepository{ 
  @override
  Future<List<ProductModel>> getProductsByStatus(String status) async {
    List<ProductModel> productModels = List<ProductModel>();
    String url = getProductByStatus + status;
    try{
       var response = await http.get(url);
       if(response.statusCode == 200){
         var jsonBody = convert.jsonDecode(response.body);
         var output = jsonBody["products"];
         if(output != null){
           output.forEach((e){
             productModels.add(ProductModel.fromJson(e));
           });
         }
       }
    }
    catch(e){
      debugPrint(e);
    }
    return productModels;
  }

  @override
  Future<bool> postStatus(ProductStatusModel input) async {
    bool status = false;
    String url = productStatus;
    var jsoninput = convert.jsonEncode(input);
    try {
      var response = await http.post(url,
                                     body: jsoninput,
                                     headers: {HttpHeaders.contentTypeHeader: "application/json"}
                                     );
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var output = convert.jsonDecode(jsonBody);
        var result = output["product"];
        if (result["status"] == "Successful") {
          status = true;
        }
      }
    } catch (e) {
      debugPrint(e);
    }

    return status;
  }
  
}
