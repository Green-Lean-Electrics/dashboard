import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/enums/user_role.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/core/redux/app_state.dart';

class GreenPersistor extends Persistor<AppState> {
  @override
  Future<void> deleteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('green_lean_state');
  }

  @override
  Future<void> persistDifference({
    AppState lastPersistedState,
    AppState newState,
  }) async {
    if (lastPersistedState == null ||
        lastPersistedState.authState != newState.authState) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          'green_lean_state', json.encode(newState.authState.toJson()));
    }
  }

  @override
  Future<AppState> readState() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var storedState = json.decode(prefs.getString('green_lean_state'));
      AuthState authState = AuthState.fromJson(storedState);
      MenuOption initialMenuOption = MenuOption.INITIAL;
      if (authState != null && authState.isAuthenticated) {
        if (authState.user.role == UserRole.MANAGER_ROLE) {
          initialMenuOption = MenuOption.MANAGER_GRID;
        } else {
          initialMenuOption = MenuOption.PROSUMER_HOME;
        }
      }
      return AppState.initialAppState()
          .copy(authState: authState, menuOption: initialMenuOption);
    } catch (_) {
      return null;
    }
  }
}
