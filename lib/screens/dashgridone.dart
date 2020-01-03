import 'package:app_drawer/models/dashboardmodel.dart';
import 'package:app_drawer/services/dashboardrepo.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;

class Gridone extends StatefulWidget {
  //Gridone({Key key}) : super(key: key);
  @override
  _GridoneState createState() => _GridoneState();
}

class _GridoneState extends State<Gridone> {
  
  Color secColor = Constants.secTextColor;
  Color card1 = Constants.card1;
  Color card2 = Constants.card2;
  Color card3 = Constants.card3;
  Color card4 = Constants.card4;

  DashboardModel dashboardModel = DashboardModel();

  @override
  void initState() {
    dashboardGet().then((data) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> dashboardGet() async {
    dashboardModel = await DashboardService().getAllDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      
      body: GridView.count(
      crossAxisCount: 1,
      children: <Widget>[
        //Card 1
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.shopping_cart, size: 50.0, color: secColor),
              title: Text(
                'Total of Product Amount',
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '€' + dashboardModel.totalProductAmount.toString(),
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          color: card1,
        ),
        //Card 2
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.devices, size: 50.0, color: secColor),
              title: Text(
                'Total of Sold Product Amount',
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '€' + dashboardModel.totalSoldProductAmount.toString(),
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          color: card2,
        ),
        //Card 3
        Card(

          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.chat_bubble, size: 50.0, color: secColor),
              title: Text(
                'Total Messages',
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalMessage.toString(),
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          color: card3,
        ),
        //Card 4
        Card(
          margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.people, size: 50.0, color: secColor),
              title: Text(
                'Total Users',
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                dashboardModel.totalUser.toString(),
                style: TextStyle(color: secColor, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          color: card4,
        ),
        
      ],
    ));
    Widget progress() {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return dashboardModel.totalApprovedProduct == null ? progress() : app;
  }
}
