
import 'package:json_annotation/json_annotation.dart';
part 'usermodel.g.dart';

@JsonSerializable()
class UserModel{
  String first_name;
  String last_name;
  int role_id;


  UserModel({
    this.first_name,
    this.last_name,
    this.role_id
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
  _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);


}