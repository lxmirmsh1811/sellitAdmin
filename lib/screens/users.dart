import 'package:app_drawer/models/usermodel.dart';
import 'package:app_drawer/services/userrepo.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {

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

    Color mainColor = Theme.of(context).accentColor;
    Color secColor = Colors.white;
    Color textColor = Colors.black;

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
          String role;
          if (userModel.role_id == 1){
            role = "Admin";
          }
          else{
            role = "User";
          }
          return Card(
            margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                    radius: 50.0,
                    child: Icon(Icons.person)
                    ),
                title: Text(userModel.first_name + ' ' + userModel.last_name),
                subtitle: Text(role),
              ),
          );
        });
    return app;
  }

    
}