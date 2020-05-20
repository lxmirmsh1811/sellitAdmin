import 'package:app_drawer/screens/add_category.dart';
import 'package:app_drawer/screens/add_sub.dart';
import 'package:app_drawer/screens/approved.dart';
import 'package:app_drawer/screens/category.dart';
import 'package:app_drawer/screens/dashgridtwo.dart';
import 'package:app_drawer/screens/home_screen.dart';
import 'package:app_drawer/screens/invalid.dart';
import 'package:app_drawer/screens/pending.dart';
import 'package:app_drawer/screens/sold.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;
import 'package:app_drawer/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/screens/login.dart';

void main(){
  Color mainColor = Constants.mainColor;
  Color secColor = Constants.secTextColor;
  Color textColor = Constants.textColor;
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Drawer App',
    theme: ThemeData(
      primaryColor: secColor,
      accentColor: mainColor,
      buttonColor: secColor,
      splashColor: mainColor,
      textTheme: TextTheme(
        title: TextStyle(color: textColor,),
        subhead: TextStyle(color: textColor),
        subtitle: TextStyle(color: secColor)
      )
    ),
    home: Login(),
    routes:{
      "/home": (BuildContext context) => HomeScreen(),
      "/category": (BuildContext context) => Category(),
      "/addCat" : (BuildContext context) => AddCategory(),
      "/addSubCat": (BuildContext context) =>  AddSubCategory(),
      "/logout" : (BuildContext context) => Login(),
      "/approved": (BuildContext context) => ApprovedProducts(),
      "/pending": (BuildContext context) =>  PendingProducts(),
      "/sold":(BuildContext context) => SoldProducts(),
      "/inactive":(BuildContext context) => InvalidProducts(),
      "/users": (BuildContext context) => User(),

    },
  );

  runApp(app);
}