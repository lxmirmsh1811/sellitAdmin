import 'package:app_drawer/models/dashboardmodel.dart';
import 'package:app_drawer/services/dashboardrepo.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;

class Gridtwo extends StatefulWidget {
  TabController controller;
  Gridtwo({this.controller});
  //Gridone({Key key}) : super(key: key);
  @override
  _GridtwoState createState() => _GridtwoState();
}

class _GridtwoState extends State<Gridtwo> {
  Color textColor = Constants.textColor;
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
        body: GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        //Card 1
        Card(
            color: Constants.card1,
            margin: EdgeInsets.only(
                left: 10.0, right: 5.0, top: 20.0, bottom: 20.0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Align(
              alignment: Alignment.center,
              // child: ListTile(
              //   leading: Icon(Icons.add_shopping_cart, size: 30.0, color: card1),
              //   title: Text(
              //     'Total Product Count',
              //     style: TextStyle(color: textColor, fontSize: 14.0),
              //     textAlign: TextAlign.center,
              //   ),
              //   subtitle: Text(
              //     dashboardModel.totalProduct.toString(),
              //     style: TextStyle(color: textColor, fontSize: 14.0),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // child: IconButton(
              //   onPressed: (){
              //     getAlert(dashboardModel.totalProduct.toString(), 'Total Product Count');
              //   },
              //   icon: Icon(Icons.add_shopping_cart, size: 50.0, color: card1)
              // )
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Icon(Icons.add_shopping_cart,
                          size: 30.0, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Total: ' + dashboardModel.totalProduct.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        // Card 2
        Card(
          color: Constants.card2,
          margin:
              EdgeInsets.only(left: 5.0, right: 10.0, top: 20.0, bottom: 20.0),
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Align(
              alignment: Alignment.center,
              // child: ListTile(
              //   leading: Icon(Icons.devices, size: 50.0, color: card2),
              //   title: Text(
              //     'Total Sold Product Count',
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              //   subtitle: Text(
              //     dashboardModel.totalSoldProduct.toString(),
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // child: IconButton(
              //   onPressed: (){
              //     getAlert(dashboardModel.totalSoldProduct.toString(), 'Total Sold Product Count');
              //   },
              //   icon: Icon(Icons.devices, size: 50.0, color: card2)
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Icon(Icons.devices,
                            size: 30.0, color: Colors.white),
                      )),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Sold: ' + dashboardModel.totalSoldProduct.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
        //Card 3
        Card(
          //margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 20.0),
          color: Constants.card3,
          margin:
              EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0, bottom: 20.0),
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Align(
              alignment: Alignment.center,
              // child: ListTile(
              //   leading: Icon(Icons.check_circle, size: 50.0, color: card3),
              //   title: Text(
              //     'Total Approved Products',
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              //   subtitle: Text(
              //     dashboardModel.totalApprovedProduct.toString(),
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // child: IconButton(
              //   onPressed: (){
              //     getAlert(dashboardModel.totalApprovedProduct.toString(), 'Total Approved Products');
              //   },
              //   icon:Icon(Icons.check_circle, size: 50.0, color: card3)
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Icon(Icons.check_circle,
                          size: 30.0, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Approved: ' +
                          dashboardModel.totalApprovedProduct.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
        //Card 4
        Card(
          //   margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
          margin:
              EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0, bottom: 20.0),
          color: card4,
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Align(
              alignment: Alignment.center,
              // child: ListTile(
              //   leading: Icon(Icons.warning, size: 50.0, color: card4),
              //   title: Text(
              //     'Total Pending Products',
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              //   subtitle: Text(
              //     dashboardModel.totalPendingProduct.toString(),
              //     style: TextStyle(color: textColor, fontSize: 30.0),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // child: IconButton(
              //   onPressed: (){
              //     getAlert(dashboardModel.totalPendingProduct.toString(), 'Total Pending Products');
              //   },
              //   icon:Center(child:Icon(Icons.warning, size: 50.0, color: Colors.white))
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Icon(Icons.warning,
                            size: 30.0, color: Colors.white),
                      )),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Pending: ' +
                          dashboardModel.totalPendingProduct.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
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
  // void getAlert(String alert, String title){
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text(title, textAlign: TextAlign.center,),
  //           content: Text(alert, textAlign: TextAlign.center),
  //           actions: <Widget>[
  //             Center(
  //               child: FlatButton(
  //                 child: Text('Ok'),
  //                 onPressed: () {
  //                    Navigator.popAndPushNamed(context, '/home');
  //                 },
  //               ),
  //             )
  //           ],
  //         );
  //       });
  // }
}
