//import 'package:app_drawer/models/productmodel.dart';
//import 'package:app_drawer/services/productrepo.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/models/productstatusmodel.dart';
import 'package:app_drawer/services/productstatusrepo.dart';
import 'package:flutter/material.dart';

class ProductsOther extends StatefulWidget{
  ProductModel productModel = ProductModel();
  ProductsOther(this.productModel);

  @override
  State<StatefulWidget> createState() {
    return ProductsOtherState(productModel);
  }
}

class ProductsOtherState extends State<ProductsOther>{
  
  ProductModel productModel = ProductModel();
  ProductsOtherState(this.productModel);
   @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).accentColor;
    var app = Scaffold(
      appBar: AppBar(
        title: Wrap(children:<Widget>[Text(productModel.name)]),
        iconTheme: IconThemeData(color: iconColor),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250.0,
            child:Image.network(productModel.image.first.url, fit: BoxFit.contain,) ,
          ),
          Padding(padding: EdgeInsets.only(top: 15.0)),
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text('Product Description'),
                  Text(productModel.description),
                ],
                ),
            ),
          ),


        ],

      ),

    );
    return app;
  }
}
  


