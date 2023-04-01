import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.id = '',
    this.email = '',
    this.avatar = '',
    this.lastName = '',
    this.firtsName = '',
  });

  @JsonKey(name: "last_name")
  final String? lastName;

  @JsonKey(name: "first_name")
  final String? firtsName;

  final String? id;
  final String? email;
  final String? avatar;

  UserModel copyWith({
    String? id,
    String? email,
    String? avatar,
    String? lastName,
    String? firtsName,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        lastName: lastName ?? this.lastName,
        firtsName: firtsName ?? this.firtsName,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
