// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productstatusmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStatusModel _$ProductStatusModelFromJson(Map<String, dynamic> json) {
  return ProductStatusModel(
    product_id: json['product_id'] as int,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$ProductStatusModelToJson(ProductStatusModel instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'status': instance.status,
    };
