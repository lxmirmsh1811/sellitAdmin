// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    name: json['name'] as String,
    description: json['description'] as String,
    parent_id: json['parent_id'] as int,
  )
    ..category_id = json['category_id'] as int
    ..sub_category = (json['sub_category'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
      'parent_id': instance.parent_id,
      'sub_category': instance.sub_category?.map((e) => e?.toJson())?.toList(),
    };
