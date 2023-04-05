// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAPiModel _$ResponseAPiModelFromJson(Map<String, dynamic> json) =>
    ResponseAPiModel(
      id: json['id'] as int? ?? 0,
      token: json['token'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$ResponseAPiModelToJson(ResponseAPiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'error': instance.error,
    };
