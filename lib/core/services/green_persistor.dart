import 'dart:convert';

import 'package:async_redux/async_redux.dart';
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
    if (lastPersistedState == null || lastPersistedState != newState) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('green_lean_state', json.encode(newState.toJson()));
    }
  }

  @override
  Future<AppState> readState() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var storedState = json.decode(prefs.getString('green_lean_state'));
      return AppState.fromJson(storedState);
    } catch (_) {
      return null;
    }
  }
}