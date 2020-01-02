import 'package:app_drawer/models/productmodel.dart';
import 'package:app_drawer/screens/drawer.dart';
import 'package:app_drawer/screens/productsother.dart';
import 'package:app_drawer/services/productrepo.dart';
import 'package:app_drawer/utilis/trimName.dart';
import 'package:app_drawer/widgets/utilwidgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SoldProducts extends StatefulWidget {
  @override
  _SoldProductsState createState() => _SoldProductsState();
}

class _SoldProductsState extends State<SoldProducts> {
  List<ProductModel> productModels = List<ProductModel>();

  @override
  void initState() {
    productGet().then((data) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> productGet() async {
    productModels = await ProductService().getProductsByStatus("2");
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).accentColor;
    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        title: Text(
          'Sold Products',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MyDrawer(),
      body: getProductList(),
    );
    return app;
  }

  GridView getProductList() {
    var app = GridView.builder(
        itemCount: productModels.length == null ? 0 : productModels.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          ProductModel productModel = ProductModel();
          productModel = productModels[index];
          //var name = TrimName.checkNameLength(productModel.name);
          var name = productModel.name;
          if (name.length <= 18) {
            name = productModel.name.toUpperCase();
          } else {
            name = trimProductName(name);
          }
          List<dynamic> imageUrls = List<dynamic>();
          productModel.image.forEach((i){
            imageUrls.add(NetworkImage(i.url));
          });
          
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsOther(productModel),
                  ),
                );
              },
              child: Card(
                elevation: 8.0,
                child: Hero(
                  tag: index,
                  child: GridTile(
                    footer: Container(
                      color: Colors.white70,
                      height: 50.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(name),
                          Text('€ ' + productModel.price)
                        ],
                      ),
                    ),
                    child: Carousel(images: imageUrls, autoplay: false, dotSize: 1,),
                    // child: FadeInImage.memoryNetwork(
                    //   placeholder: kTransparentImage,
                    //   image: productModel.image.first.url,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    // child: Image.asset(
                    //   'images/admin.png',
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                ),
              ),
            ),
          );
        });

    return productModels.length == 0 ? UtilWidgets.gridProgress() : app;
  }

  String trimProductName(String title) {
    var result = title.substring(0, 18).toUpperCase() + '...';
    return result;
  }
}
