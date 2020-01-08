import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/models/productstatusmodel.dart';
import 'package:app_drawer/services/productrepo.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app_drawer/utilis/constants.dart' as Constants;

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

    List<dynamic> imageUrls = List<dynamic>();
    productModel.image.forEach((i) {
      imageUrls.add(NetworkImage(i.url));
    });

    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Wrap(children: <Widget>[Text(productModel.name)]),
        iconTheme: IconThemeData(color: iconColor),
      ),
      body: ListView(
       scrollDirection: Axis.vertical,
        children: <Widget>[
          _getImages(imageUrls),
        Padding(padding: EdgeInsets.only(bottom: 10.0),),
        _getDescription(productModel.description),
        _getMoreDescription(productModel.more_details),
        _getButtonFunc(productModel)
        ],
      )
      // body: Column(children: <Widget>[
      //   _getImages(imageUrls),
      //   Padding(padding: EdgeInsets.only(bottom: 10.0),),
      //   _getDescription(productModel.description),
      //   _getMoreDescription(productModel.more_details),
      //   _getButtonFunc(productModel)
      // ]),
    );
    return app;
  }

  Future<bool> _postApproveStatus(int product_id) async {
    ProductStatusModel input =
        ProductStatusModel(productid: product_id, status: 1);
    bool result = await ProductService().postStatus(input);
    return result;
  }

  Future<bool> _postDenyStatus(int product_id) async {
    ProductStatusModel input =
        ProductStatusModel(productid: product_id, status: 5);
    bool result = await ProductService().postStatus(input);
    return result;
  }

  Widget _getImages(List imageUrls) {
    return Container(
      height: 300.0,
      child: Carousel(
        images: imageUrls,
        autoplay: false,
        dotSize: 1,
      ),
    );
  }

  Widget _getDescription(String description) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTitle(),
            Text(
              productModel.description,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
      ),
    );
  }

  Widget _getButtonFunc(ProductModel productModel) {
    Color btnColor = Constants.btnColor;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text('Approve'),
            color: btnColor,
            onPressed: () {
              _postApproveStatus(productModel.product_id).then((data) {
                if (data) {
                  debugPrint('Product Approved');
                  _showApproveDialog(productModel.name);
                  //Navigator.of(context).pushNamed("/approved");
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text('Deny'),
            color: Colors.grey,
            onPressed: () {
              _postDenyStatus(productModel.product_id).then((data) {
                if (data) {
                  debugPrint('Product Denied');
                  _showDenyDialog(productModel.name);
                 // Navigator.of(context).pushNamed("/inactive");
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
        ],
     // ),
    );
  }

  Widget _getTitle() {
    return
        Text(
          'Product Description',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,  
    );
  }

  Widget _getMoreDescription(String more_details) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('More Details', style: TextStyle(fontSize:18.0, fontWeight: FontWeight.bold)),
          Text(
            productModel.more_details,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
  void _showApproveDialog(String name){
      showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Product status'),
          content: Text('Product \'$name\' has been Approved'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pushNamed("/approved");
              },
              )
          ],
        );
      }
    );
  }

  void _showDenyDialog(String name){
      showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Product status'),
          content: Text('Product \'$name\' has been Denied'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                 Navigator.of(context).pushNamed("/inactive");
              },
              )
          ],
        );
      }
    );
  }
}
