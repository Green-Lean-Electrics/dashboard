import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/actions/login_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginFormConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        model: ViewModel(),
        builder: (context, model) => LoginForm(
              onLogin: model.onLogin,
              isLoading: model.isLoading,
            ));
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  Function(String, String) onLogin;
  bool isLoading;

  ViewModel.build({@required this.onLogin, @required this.isLoading})
      : super(equals: [isLoading]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onLogin: (email, password) => dispatchFuture(
          LoginAction(email: email, password: password),
        ),
        isLoading: state.isLoading,
      );
}
