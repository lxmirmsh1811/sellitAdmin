

import 'package:app_drawer/models/imagemodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'productmodel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel{
  int product_id;
  String name;
  String slug;
  String description;
  String price;
  int seller_id;
  String more_details;
  int status;
  int category_id;
  int brand_id;
  int product_condition;
  List<ImageModel> image;


  ProductModel({
    this.product_id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.seller_id,
    this.more_details,
    this.status,
    this.category_id,
    this.brand_id,
    this.product_condition,
    this.image
  });

    factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}

