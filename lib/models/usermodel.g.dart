// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    role_id: json['role_id'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'role_id': instance.role_id,
    };
