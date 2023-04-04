// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesModel _$ImagesModelFromJson(Map<String, dynamic> json) => ImagesModel(
      id: json['id'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$ImagesModelToJson(ImagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
    };
