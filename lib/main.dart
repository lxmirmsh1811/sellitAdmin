import 'package:app_drawer/screens/add_category.dart';
import 'package:app_drawer/screens/add_sub.dart';
import 'package:app_drawer/screens/approved.dart';
import 'package:app_drawer/screens/category.dart';
import 'package:app_drawer/screens/dashboard.dart';
//import 'package:app_drawer/screens/dashboard.dart';
import 'package:app_drawer/screens/home_screen.dart';
import 'package:app_drawer/screens/invalid.dart';
import 'package:app_drawer/screens/pending.dart';
import 'package:app_drawer/screens/sold.dart';
import 'package:app_drawer/screens/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/screens/login.dart';

void main(){
  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
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
    routes: <String, WidgetBuilder>{
      "/home": (BuildContext context) => new HomeScreen(),
      "/category": (BuildContext context) => new Category(),
   //   "/subCategory": (BuildContext context) => new SubCategory(),
      "/addCat" : (BuildContext context) => AddCategory(),
      "/addSubCat": (BuildContext context) => new AddSubCategory(),
      "/logout" : (BuildContext context) => new Login(),
      "/approved": (BuildContext context) => new ApprovedProducts(),
      "/pending": (BuildContext context) => new PendingProducts(),
      "/sold":(BuildContext context) => new SoldProducts(),
      "/inactive":(BuildContext context) => new InvalidProducts(),

    },
  );

  runApp(app);
}