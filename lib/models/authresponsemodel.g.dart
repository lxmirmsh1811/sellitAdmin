// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authresponsemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return AuthResponseModel(
    status: json['status'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'username': instance.username,
    };
