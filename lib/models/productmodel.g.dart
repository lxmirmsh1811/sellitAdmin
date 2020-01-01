// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    product_id: json['product_id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    description: json['description'] as String,
    price: json['price'] as String,
    seller_id: json['seller_id'] as int,
    more_details: json['more_details'] as String,
    status: json['status'] as int,
    category_id: json['category_id'] as int,
    brand_id: json['brand_id'] as int,
    product_condition: json['product_condition'] as int,
    image: (json['image'] as List)
        ?.map((e) =>
            e == null ? null : ImageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'price': instance.price,
      'seller_id': instance.seller_id,
      'more_details': instance.more_details,
      'status': instance.status,
      'category_id': instance.category_id,
      'brand_id': instance.brand_id,
      'product_condition': instance.product_condition,
      'image': instance.image?.map((e) => e?.toJson())?.toList(),
    };
