
import 'package:json_annotation/json_annotation.dart';

part 'productstatusmodel.g.dart';

@JsonSerializable()
class ProductStatusModel {
  int product_id;
  int status;
    
 

  ProductStatusModel({this.product_id, this.status});

  factory ProductStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ProductStatusModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$ProductStatusModelToJson(this);
}