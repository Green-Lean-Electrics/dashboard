import 'dart:async';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';

class LoginAction extends ReduxAction<AppState> {
  final String email;
  final String password;

  LoginAction({
    @required this.email,
    @required this.password,
  });

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService api = locator<ApiService>();
    AuthState authState = await api.login(this.email, this.password);
    
    return state.copy(authState: authState);
  }

  void after() => dispatch(SetLoadingAction(isLoading: false));

  @override
  Object wrapError(error) => UserException(error.toString(), cause: error);
}

class LogoutAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    ApiService api = locator<ApiService>();
    return state.copy(authState: api.logout());
  }
}
