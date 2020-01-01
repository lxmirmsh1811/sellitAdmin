//import 'package:app_drawer/models/productmodel.dart';
//import 'package:app_drawer/services/productrepo.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/models/productstatusmodel.dart';
import 'package:app_drawer/services/productrepo.dart';
//import 'package:app_drawer/services/productstatusrepo.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  ProductModel productModel = ProductModel();
  Product(this.productModel);

  @override
  State<StatefulWidget> createState() {
    return ProductState(productModel);
  }
}

class ProductState extends State<Product> {
  
  ProductModel productModel = ProductModel();
  ProductState(this.productModel);


  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).accentColor;
    var app = Scaffold(
      appBar: AppBar(
        title: Wrap(children: <Widget>[Text(productModel.name)]),
        iconTheme: IconThemeData(color: iconColor),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Image.network(
              productModel.image.first.url,
              fit: BoxFit.contain,
            ),
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
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('Approve'),
                color: iconColor,
                onPressed: () {
                  _postStatus(productModel.product_id).then((data) {
                    if (data) {
                      debugPrint('Product Approved');
                      Navigator.of(context).pushNamed("/approved");
                    }
                  });
                },
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Deny'),
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
    return app;
  }

  Future<bool> _postStatus(int product_id) async {
    ProductStatusModel input =
        ProductStatusModel(product_id: product_id, status: 1);
    bool result = await ProductService().postStatus(input);
    return result;
  }
}
