import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'response_api_model.g.dart';

@JsonSerializable()
class ResponseAPiModel {
  const ResponseAPiModel({
    this.id = 0,
    this.token = '',
    this.error = '',
  });

  final int? id;
  final String? token;
  final String? error;

  ResponseAPiModel copyWith({
    int? id,
    String? token,
    String? error,
  }) =>
      ResponseAPiModel(
        id: id ?? this.id,
        token: token ?? this.token,
        error: error ?? this.error,
      );

  factory ResponseAPiModel.fromRawJson(String str) =>
      ResponseAPiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseAPiModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseAPiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAPiModelToJson(this);
}
