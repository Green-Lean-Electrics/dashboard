import 'dart:async';
import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:meta/meta.dart';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/core/redux/app_state.dart';

import 'package:latlong/latlong.dart';
import 'package:async_redux/async_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAction extends ReduxAction<AppState> {
  final String email;
  final String password;

  LoginAction({
    @required this.email,
    @required this.password,
  });

  @override
  Future<AppState> reduce() async {
    dispatch(StartLoadingAction(loadingLocation: LoadingLocations.LOGIN_FORM));
    ApiService api = locator<ApiService>();
    AuthState authState = await api.login(this.email, this.password);

    return state.copy(authState: authState);
  }

  void after() =>
      dispatch(EndLoadingAction(loadingLocation: LoadingLocations.LOGIN_FORM));
}

class SignUpAction extends ReduxAction<AppState> {
  final String name;
  final String email;
  final String password;
  final LatLng coords;

  SignUpAction({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.coords,
  });

  @override
  Future<AppState> reduce() async {
    dispatch(StartLoadingAction(loadingLocation: LoadingLocations.SIGNUP_FORM));
    ApiService api = locator<ApiService>();
    AuthState authState = await api.signUp(name, email, password, coords);

    return state.copy(authState: authState);
  }

  void after() =>
      dispatch(EndLoadingAction(loadingLocation: LoadingLocations.SIGNUP_FORM));
}

class LogoutAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    ApiService api = locator<ApiService>();
    api.logout();
    return AppState.initialAppState();
  }
}
