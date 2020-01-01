import 'dart:convert' as convert;

import 'package:app_drawer/models/dashboardmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class DashboardRepository{
  Future<DashboardModel> getAllDashboardData();
}

class DashboardService extends DashboardRepository{

  @override
  Future<DashboardModel> getAllDashboardData() async {
    String url = 'http://3.134.103.215:3000/api/v1/dashboard/api';
    DashboardModel dashboardModel = DashboardModel();
    try{
        var response = await http.get(url);
        if (response.statusCode == 200){
          var jsonBody = convert.jsonDecode(response.body);
          dashboardModel = DashboardModel.fromJson(jsonBody);
        }

    }
    catch(e){
      debugPrint(e);
    }
    return dashboardModel;
  }

}