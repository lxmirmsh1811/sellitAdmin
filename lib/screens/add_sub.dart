//import 'package:app_drawer/screens/drawer.dart';
import 'package:app_drawer/models/categorymodel.dart';
import 'package:app_drawer/services/categoryrepo.dart';
import 'package:flutter/material.dart';

class AddSubCategory extends StatefulWidget{
  final int parentid;
  AddSubCategory({this.parentid});
  @override
  State<StatefulWidget> createState() {
    return AddSubCategoryState();
  }
}

class AddSubCategoryState extends State<AddSubCategory>{
  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
  final btnColor = const Color(0xFFfb8385);

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Add SubCategory',style: TextStyle(color: textColor),),
        backgroundColor: secColor,
        iconTheme: IconThemeData(color: mainColor),
      ),
      //drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
         // _catList(),
          _subCatName(),
          _subCatDesc(),
          Row(children: <Widget>[
          _saveCat(),
          _closeCat(),
          ],)
        ],
      )
    );
    return app;
  }

  //Add Code for get Category drop down

  Widget _subCatName(){
    var app = Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: titleController,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: 'Sub Category Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        )
        // errorText: 'Please enter a valid username/matrikel number',
        // errorStyle: TextStyle(color: textColor)
      ),
    )
    );
    return app;
  }

  Widget _subCatDesc(){
    var app = Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: descController,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: 'Sub Category Description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        )
        // errorText: 'Please enter a valid username/matrikel number',
        // errorStyle: TextStyle(color: textColor)
      ),
    )
    );
    return app;
  }

  Widget _saveCat(){
    var app = Expanded(
      child:Padding(
        padding: EdgeInsets.all(15.0),
        child:RaisedButton(
      color: btnColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "Save",
        style: TextStyle(
          color: textColor,
          )
      ),
     onPressed: () {
        debugPrint('Save Category Pressed');
      _postSubCategory(titleController.text, descController.text, widget.parentid)
                      .then((data) {
                    if (data) {
                      Navigator.of(context).pushNamed("/category");
                    }
                  });
        //Navigator.of(context).pushNamed("/home");
      }
    )
      )
    );

  return app;
  }

  Widget _closeCat(){
    var app = Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child:RaisedButton(
      color: btnColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "Close",
        style: TextStyle(
          color: textColor,
          )
      ),
     onPressed: () {
        debugPrint('Close Category Pressed');
        Navigator.of(context).pushNamed("/category");
      }
    )
      )
    );

  return app;
  }

    Future<bool> _postSubCategory(String name, String description, int parentid) async {
    CategoryModel input =
        CategoryModel(name: name, description: description, parent_id: parentid);
    bool result = await CategoryService().addCategory(input);
    return result;
  }

}