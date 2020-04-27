import 'dart:convert';

import 'package:dashboard/core/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_state.g.dart';

@JsonSerializable()
@immutable
class AuthState {
  final String token;
  final User user;
  final bool isAuthenticated;

  AuthState({
    @required this.user,
    @required this.token,
    @required this.isAuthenticated,
  });

  AuthState copy({
    String token,
    User user,
    bool isAuthenticated,
  }) {
    return AuthState(
      token: token ?? this.token,
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }


  @override
  int get hashCode => user.hashCode ^ token.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is AuthState &&
          this.user == other.user &&
          this.token == other.token &&
          this.isAuthenticated == other.isAuthenticated);
  

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);      
}
