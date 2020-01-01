//import 'package:app_drawer/services/authrepo.dart';
//import 'package:app_drawer/services/authrepo.dart';
import 'package:app_drawer/models/authmodel.dart';
import 'package:app_drawer/models/authresponsemodel.dart';
import 'package:app_drawer/services/authrepo.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }

}

class MyDrawerState extends State<MyDrawer>{

  String username;
  MyDrawerState();
  MyDrawerState.username(this.username);
  
  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        
        child: ListView(
          children: <Widget>[
            _drawerHeader(),
            _dashboard(context),
            _products(),
            _categories(context),
            _users(),
            _logout(context),
          ],
        ),
      );
  }

  Widget _drawerHeader(){
    
    var app = DrawerHeader(
      decoration: BoxDecoration(
        color: secColor,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('images/admin.png', width:80.0, height: 80.0),
              ),
            ),
            Text('Admin',style: TextStyle(color: textColor, fontSize: 12.0, fontWeight: FontWeight.bold),),
            Text('Admin',style: TextStyle(color: mainColor, fontSize: 10.0),)
          ],
        ),
      ),
    );
    return app;
  }

  // Future<String> _getUserName(AuthModel userName) async {
  //   var username = await AuthServices().getUser(userName);
  //   return username;
  // }

  Widget _dashboard(BuildContext context){

    var app = ListTile(
      leading: Icon(Icons.home),
      title: Text('Dashboard'),
      onTap: (){
        Navigator.popAndPushNamed(context, '/home');
      },
    );

    return app;
  }

  Widget _logout(BuildContext context){

    var app = ListTile(
      leading: Icon(Icons.home),
      title: Text('Logout'),
      onTap: (){
        Navigator.popAndPushNamed(context, '/logout');
      },
    );

    return app;
  }

  Widget _categories(BuildContext context){
    var app = ListTile(
      leading: Icon(Icons.category),
      title: Text('Categories'),
      onTap: (){
        Navigator.popAndPushNamed(context, '/category');
        },
    );
    return app;
  }

  Widget _users(){
    var app = ListTile(
      leading: Icon(Icons.people),
      title: Text('Users'),
      onTap: (){
        Navigator.popAndPushNamed(context, '/users');
      },
    );
    return app;
  }

  Widget _products(){
    var app = ExpansionTile(
      leading: Icon(Icons.devices_other),
      title: Text('Products'),
      children: <Widget>[
        ListTile(
          title: Text('   Pending Products'),
          onTap: (){
            Navigator.popAndPushNamed(context, '/pending');
          },
        ),
        ListTile(
          title: Text('   Approved Products'),
          onTap: (){
            Navigator.popAndPushNamed(context, '/approved');
          },
        ),
        ListTile(
          title: Text('   Sold Products'),
          onTap: (){
            Navigator.popAndPushNamed(context, '/sold');
          },
        ),
        ListTile(
          title: Text('   Inactive Products'),
          onTap: (){
            Navigator.popAndPushNamed(context, '/inactive');
          },
        ),
      ],
    );
    return app;
  }
}