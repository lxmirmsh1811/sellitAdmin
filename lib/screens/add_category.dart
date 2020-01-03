//import 'package:app_drawer/screens/drawer.dart';
//import 'package:app_drawer/services/authrepo.dart';
import 'package:app_drawer/models/categorymodel.dart';
import 'package:app_drawer/screens/add_sub.dart';
import 'package:app_drawer/services/categoryrepo.dart';
import 'package:flutter/material.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;

class AddCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCategoryState();
  }
}

class AddCategoryState extends State<AddCategory> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController(); 
  
  Color mainColor = Constants.mainColor;
  Color secColor = Constants.secTextColor;
  Color textColor = Constants.textColor;
  Color btnColor = Constants.btnColor;

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Add Category',
            style: TextStyle(color: textColor),
          ),
          backgroundColor: secColor,
          iconTheme: IconThemeData(color: mainColor),
        ),
        //drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            _categoryName(),
            _categoryDesc(),
            Row(
              children: <Widget>[
                _saveCat(),
                _closeCat(),
              ],
            )
          ],
        ));
    return app;
  }

  Widget _categoryName() {
    var app = Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: titleController,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
              hintText: 'Category Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
              // errorText: 'Please enter a valid username/matrikel number',
              // errorStyle: TextStyle(color: textColor)
              ),
        ));
    return app;
  }

  Widget _categoryDesc() {
    var app = Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: descController,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
              hintText: 'Category Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
              // errorText: 'Please enter a valid username/matrikel number',
              // errorStyle: TextStyle(color: textColor)
              ),
        ));
    return app;
  }

  Widget _saveCat() {
    var app = Expanded(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: RaisedButton(
                color: btnColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("Save",
                    style: TextStyle(
                      color: textColor,
                    )),
                onPressed: () {
                  debugPrint('Save Category Pressed');
                  _postCategory(titleController.text, descController.text)
                      .then((data) {
                    if (data) {
                      Navigator.of(context).pushNamed("/category");
                    }
                  });

                  //Navigator.of(context).pushNamed("/home");
                })));

    return app;
  }

  Future<bool> _postCategory(String name, String description) async {
    CategoryModel input =
        CategoryModel(name: name, description: description, parent_id: 0);
    bool result = await CategoryService().addCategory(input);
    return result;
  }

  Widget _closeCat() {
    var app = Expanded(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: RaisedButton(
                color: btnColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("Close",
                    style: TextStyle(
                      color: textColor,
                    )),
                onPressed: () {
                  debugPrint('Close Category Pressed');
                  Navigator.of(context).pushNamed("/category");
                })));

    return app;
  }
}
