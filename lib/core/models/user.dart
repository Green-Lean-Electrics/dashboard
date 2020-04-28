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
  final String householdId;
  final UserRole role;

  User({
    @required this.name,
    @required this.email,
    @required this.profilePictureURL,
    @required this.householdId,
    @required this.role,
  });

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode => name.hashCode ^ householdId.hashCode ^ role.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User &&
          this.name == other.name &&
          this.email == other.email &&
          this.profilePictureURL == other.profilePictureURL &&
          this.householdId == other.householdId &&
          this.role == other.role);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
