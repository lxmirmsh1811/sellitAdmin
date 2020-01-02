// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productstatusmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStatusModel _$ProductStatusModelFromJson(Map<String, dynamic> json) {
  return ProductStatusModel(
    productid: json['productid'] as int,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$ProductStatusModelToJson(ProductStatusModel instance) =>
    <String, dynamic>{
      'productid': instance.productid,
      'status': instance.status,
    };
