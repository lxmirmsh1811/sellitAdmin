
import 'package:json_annotation/json_annotation.dart';

part 'authresponsemodel.g.dart';

@JsonSerializable()
class AuthResponseModel {
  String status;
  String username;
  AuthResponseModel.user(this.username);
  AuthResponseModel({this.status, this.username});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}