import 'package:app_drawer/models/categorymodel.dart';
import 'package:app_drawer/screens/drawer.dart';
import 'package:app_drawer/screens/subcategory.dart';
import 'package:app_drawer/services/categoryrepo.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }
}

class CategoryState extends State<Category> {
  List<CategoryModel> categoryModel = List<CategoryModel>();

  @override
  void initState() {
    categoryGet().then((data) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> categoryGet() async {
    categoryModel = await CategoryService().getAllCategoryData();
  }

  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
  final btnColor = const Color(0xFFfb8385);
  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(color: textColor),
        ),
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: secColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 30.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/addCat');
        },
      ),
      drawer: MyDrawer(),
      body: getCategoryList(),
    );
    return app;
  }

  ListView getCategoryList() {
    var app = ListView.builder(
        itemCount: categoryModel.length == null ? 0 : categoryModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                debugPrint(categoryModel[index].sub_category.length.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SubCategory(subcategoryModel:categoryModel[index].sub_category, categoryid: categoryModel[index].category_id,);
                  //return SubCategory(
                  //    categoryModel: categoryModel);
                }));
              },
              child: ListTile(
                leading: CircleAvatar(
                    radius: 50.0,
                    child: Text(getTitle(categoryModel[index].name))),
                title: Text(categoryModel[index].name),
                subtitle: Text(categoryModel[index].description),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        });
    return app;
  }

  String getTitle(String title) {
    var result = "";
    return result = title.substring(0, 2);
  }
}
