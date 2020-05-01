import 'dart:async';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';

class UpdateProfileAction extends ReduxAction<AppState> {
  final String name;
  final String email;
  final String password;

  UpdateProfileAction({
    @required this.name,
    @required this.email,
    @required this.password,
  });

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService api = locator<ApiService>();
    User updatedUser = await api.updateProfile(name, email, password);

    return state.copy(
      authState: state.authState.copy(
        user: updatedUser,
      ),
    );
  }

  void after() => dispatch(SetLoadingAction(isLoading: false));
}
