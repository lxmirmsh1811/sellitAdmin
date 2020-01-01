import 'package:json_annotation/json_annotation.dart';

part 'categorymodel.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel{
  int category_id;
  String name;
  String description;
  int parent_id;
  List<CategoryModel> sub_category;

  CategoryModel({this.name, this.description, this.parent_id});

    factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}