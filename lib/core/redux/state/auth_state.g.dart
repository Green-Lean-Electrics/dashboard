// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return AuthState(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String,
    isAuthenticated: json['isAuthenticated'] as bool,
  );
}

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'isAuthenticated': instance.isAuthenticated,
    };
