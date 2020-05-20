import 'package:app_drawer/screens/dashgridone.dart';
import 'package:app_drawer/screens/dashgridtwo.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{

  final TabController tabController;

  Dashboard(this.tabController);

  @override
  State<StatefulWidget> createState() {
    return DashboardState(tabController);
  }
}
class DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  
  TabController tabController;
 
  DashboardState(this.tabController);


  @override
  Widget build(BuildContext context) {
    
    var app = TabBarView(
      controller: tabController,
      children: <Widget>[
        // Gridone(),
       PieChartSample2(),
       Gridtwo(),
       
      ],
      
    );

    return app;
  }

}  


    