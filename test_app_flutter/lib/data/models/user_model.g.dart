// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      firtsName: json['first_name'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'last_name': instance.lastName,
      'first_name': instance.firtsName,
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
    };
