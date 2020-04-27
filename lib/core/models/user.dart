import 'dart:convert';

import 'package:dashboard/core/enums/user_role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String profilePictureURL;
  final UserRole userRole;

  User({
    @required this.name,
    @required this.email,
    @required this.profilePictureURL,
    @required this.userRole,
  });

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode => name.hashCode ^ userRole.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User &&
          this.name == other.name &&
          this.email == other.email &&
          this.profilePictureURL == other.profilePictureURL &&
          this.userRole == other.userRole);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
