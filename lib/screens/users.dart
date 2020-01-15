import 'dart:math';

import 'package:app_drawer/models/usermodel.dart';
import 'package:app_drawer/screens/login.dart';
import 'package:app_drawer/services/userrepo.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;
import 'drawer.dart';

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  List<UserModel> userModels = List<UserModel>();

  @override
  void initState() {
    userGet().then((data) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> userGet() async {
    userModels = await UserService().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Constants.mainColor;
    Color secColor = Constants.secTextColor;
    Color textColor = Constants.textColor;

    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(color: textColor),
        ),
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: secColor,
      ),
      drawer: MyDrawer(),
      body: getUserList(),
    );
    return app;
  }

  ListView getUserList() {
    var app = ListView.builder(
        itemCount: userModels.length == null ? 0 : userModels.length,
        itemBuilder: (BuildContext context, int index) {
          UserModel userModel = userModels[index];
          String fullName = userModel.first_name + ' ' + userModel.last_name;
          String role;
          if (userModel.role_id == 1) {
            role = "Admin";
          } else {
            role = "User";
          }
          return ListTile(
            leading: CircleAvatar(
                backgroundColor:
                    Colors.accents[Random().nextInt(Colors.accents.length)],
                radius: 22.0,
                // child: Icon(Icons.person)
                child: Text(_getTitle(userModel.first_name),style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),),),
            title: Text(fullName),
            subtitle: Text(role),
          );
          // return Card(
          //   margin: EdgeInsets.all(10.0),
          //   child: ListTile(
          //     leading: CircleAvatar(
          //         backgroundColor: Colors.accents[Random().nextInt(Colors.accents.length)] ,
          //         radius: 50.0,
          //         // child: Icon(Icons.person)
          //         child: Text(getTitle(userModel.first_name))),
          //     title: Text(fullName),
          //     subtitle: Text(role),
          //   ),
          // );
        });
    return app;
  }

  String _getTitle(String first_name) {
    return first_name.substring(0, 1);
  }
}
