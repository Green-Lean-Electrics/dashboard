import 'dart:convert';

import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_state.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final AuthState authState;
  final Set<LoadingLocations> loadingLocations;
  final MenuOption menuOption;
  final MyGLEData myGLEData;

  AppState({
    @required this.authState,
    @required this.loadingLocations,
    @required this.menuOption,
    @required this.myGLEData,
  });

  AppState copy({
    AuthState authState,
    Set<LoadingLocations> loadingLocations,
    MenuOption menuOption,
    MyGLEData myGLEData,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      loadingLocations: loadingLocations ?? this.loadingLocations,
      menuOption: menuOption ?? this.menuOption,
      myGLEData: myGLEData ?? this.myGLEData,
    );
  }

  static AppState initialAppState() => AppState(
      authState: AuthState(
        user: null,
        token: null,
        isAuthenticated: false,
      ),
      loadingLocations: {},
      menuOption: MenuOption.PROSUMER_HOME,
      myGLEData: null);

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode =>
      authState.hashCode ^
      loadingLocations.hashCode ^
      menuOption.hashCode ^
      myGLEData.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is AppState &&
          this.authState == other.authState &&
          setEquals(this.loadingLocations, other.loadingLocations) &&
          this.menuOption == other.menuOption &&
          this.myGLEData == other.myGLEData);

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
