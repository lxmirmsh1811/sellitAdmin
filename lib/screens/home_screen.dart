
import 'package:flutter/material.dart';
import 'package:app_drawer/screens/dashboard.dart';
import 'package:app_drawer/screens/drawer.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  HomeScreenState({this.tabController});

  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',style: TextStyle(color: textColor),),
        backgroundColor: secColor,
        iconTheme: IconThemeData(color: mainColor),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.dashboard),),
            Tab(icon: Icon(Icons.assessment))
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Dashboard(tabController),
    );
    return app;
  }
}