import 'dart:convert';

import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_state.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final AuthState authState;
  final bool isLoading;
  final MenuOption menuOption;

  AppState({
    @required this.authState,
    @required this.isLoading,
    @required this.menuOption,
  });

  AppState copy({AuthState authState, bool isLoading, MenuOption menuOption}) {
    return AppState(
      authState: authState ?? this.authState,
      isLoading: isLoading ?? this.isLoading,
      menuOption: menuOption ?? this.menuOption,
    );
  }

  static AppState initialAppState() => AppState(
        authState: AuthState(
          user: null,
          token: null,
          isAuthenticated: false,
        ),
        isLoading: false,
        menuOption: MenuOption.PROSUMER_HOME,
      );

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode =>
      authState.hashCode ^ isLoading.hashCode ^ menuOption.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is AppState &&
          this.authState == other.authState &&
          this.isLoading == other.isLoading &&
          this.menuOption == other.menuOption);

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
