
import 'package:json_annotation/json_annotation.dart';
part 'imagemodel.g.dart';

@JsonSerializable()
class ImageModel {
  String url;

  ImageModel({this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);


         
}