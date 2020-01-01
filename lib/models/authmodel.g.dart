// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return AuthModel(
    matrikel_number: json['matrikel_number'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'matrikel_number': instance.matrikel_number,
      'password': instance.password,
    };
