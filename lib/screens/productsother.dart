import 'package:app_drawer/models/productmodel.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
    List<dynamic> imageUrls = List<dynamic>();
    productModel.image.forEach((i) {
      imageUrls.add(NetworkImage(i.url));
    });
    Color iconColor = Theme.of(context).accentColor;
    var app = Scaffold(
      appBar: AppBar(
        title: Wrap(children:<Widget>[Text(productModel.name)]),
        iconTheme: IconThemeData(color: iconColor),
      ),
      body: Column(children: <Widget>[
        _getImages(imageUrls),
        Padding(padding: EdgeInsets.only(bottom: 10.0),),
        _getDescription(productModel.description),
        _getMoreDescription(productModel.more_details),
      ]),
    );
    return app;
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

}
  


