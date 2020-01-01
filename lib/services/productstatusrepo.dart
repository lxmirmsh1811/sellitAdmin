import 'dart:io';

import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/models/productstatusmodel.dart';
import 'package:app_drawer/utilis/urllinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ProductStatusRepo {
  Future<bool> postStatus(ProductStatusModel input);
}
 
class ProductStatusServices extends ProductStatusRepo {
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
