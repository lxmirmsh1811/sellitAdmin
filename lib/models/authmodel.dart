import 'package:json_annotation/json_annotation.dart';

part 'authmodel.g.dart';

@JsonSerializable()
class AuthModel {
  String matrikel_number;
  String password;

  AuthModel(
    {this.matrikel_number,
    this.password,
    }
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);


}