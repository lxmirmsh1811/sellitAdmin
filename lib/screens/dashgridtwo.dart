import 'package:app_drawer/models/dashboardmodel.dart';
import 'package:app_drawer/services/dashboardrepo.dart';
import 'package:flutter/material.dart';

class Gridtwo extends StatefulWidget {
  //Gridone({Key key}) : super(key: key);
  @override
  _GridtwoState createState() => _GridtwoState();
}

class _GridtwoState extends State<Gridtwo> {

  final color1 = const Color(0xFFFFBF37);
  final color2 = const Color(0xFF00CECE);
  final color3 = const Color(0xFFFB777A);
  final color4 = const Color(0xFFA5A5A5);

  DashboardModel dashboardModel = DashboardModel();

  @override
  void initState(){
    dashboardGet().then((data){
      setState(() {
        
      });
    });
    super.initState();
  }

   Future<void> dashboardGet() async{
   dashboardModel =  await DashboardService().getAllDashboardData();
  }
  
  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          //Card 1
          Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 20.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.add_shopping_cart, size: 50.0, color: color1),
              title: Text(
                'Total Product Count',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalProduct.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        // Card 2
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 20.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.devices, size: 50.0, color: color2),
              title: Text(
                'Total Sold Product Count',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalSoldProduct.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        //Card 3
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 20.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.check_circle, size: 50.0, color: color3),
              title: Text(
                'Total Approved Products',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalApprovedProduct.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        //Card 4
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.warning, size: 50.0, color: color4),
              title: Text(
                'Total Pending Products',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalPendingProduct.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        ],

      )  

    );
    Widget progress(){
      return Center(
        child: CircularProgressIndicator(),
        );
      }
    return dashboardModel.totalApprovedProduct == null ? progress() : app;
  }
}