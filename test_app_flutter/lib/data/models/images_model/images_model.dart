import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImagesModel {
  const ImagesModel({
    this.id = 0,
    this.url = '',
    this.title = '',
  });

  final int? id;
  final String? url;
  final String? title;

  ImagesModel copyWith({
    int? id,
    String? url,
    String? title,
  }) =>
      ImagesModel(
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
      );

  factory ImagesModel.fromRawJson(String str) =>
      ImagesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);
}
