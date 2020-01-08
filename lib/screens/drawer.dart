import 'package:app_drawer/screens/login.dart';
import 'package:app_drawer/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  LoginState loginState = LoginState();
  String value;
  

  @override
  void initState() {
    readCreds().then((data){
      setState(() {
      });
    });
    super.initState();
  }

  Future<String> readCreds() async {
    value = await loginState.storage.read(key: "token1");
    return value;
  }

  

  Color mainColor = Constants.mainColor;
  Color secColor = Constants.secTextColor;
  Color textColor = Constants.textColor;
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

  Widget _drawerHeader() {
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
                child:
                    Image.asset('images/admin.png', width: 80.0, height: 80.0),
              ),
            ),
            Text(
         //     value,
              'Admin',
              style: TextStyle(
                  color: textColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Admin',
              style: TextStyle(color: mainColor, fontSize: 10.0),
            )
          ],
        ),
      ),
    );
    return app;
  }

  Widget _dashboard(BuildContext context) {
    var app = ListTile(
      leading: Icon(Icons.home),
      title: Text('Dashboard'),
      onTap: () {
        Navigator.popAndPushNamed(context, '/home');
      },
    );

    return app;
  }

  Widget _logout(BuildContext context) {
    var app = ListTile(
      leading: Icon(Icons.home),
      title: Text('Logout'),
      onTap: () {
        Navigator.popAndPushNamed(context, '/logout');
      },
    );

    return app;
  }

  Widget _categories(BuildContext context) {
    var app = ListTile(
      leading: Icon(Icons.category),
      title: Text('Categories'),
      onTap: () {
        Navigator.popAndPushNamed(context, '/category');
      },
    );
    return app;
  }

  Widget _users() {
    var app = ListTile(
      leading: Icon(Icons.people),
      title: Text('Users'),
      onTap: () {
        Navigator.popAndPushNamed(context, '/users');
      },
    );
    return app;
  }

  Widget _products() {
    var app = ExpansionTile(
      leading: Icon(Icons.devices_other),
      title: Text('Products'),
      children: <Widget>[
        ListTile(
          title: Text('   Pending Products'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/pending');
          },
        ),
        ListTile(
          title: Text('   Approved Products'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/approved');
          },
        ),
        ListTile(
          title: Text('   Sold Products'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/sold');
          },
        ),
        ListTile(
          title: Text('   Inactive Products'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/inactive');
          },
        ),
      ],
    );
    return app;
  }
}
