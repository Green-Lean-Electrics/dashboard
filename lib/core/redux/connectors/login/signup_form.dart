import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/login/signup_form.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';

class SignUpFormConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        model: ViewModel(),
        builder: (context, model) => SignUpForm(
              onSignUp: model.onSignUp,
              isLoading: model.isLoading,
            ));
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  Function(String, String, String, LatLng) onSignUp;
  bool isLoading;

  ViewModel.build({@required this.onSignUp, @required this.isLoading})
      : super(equals: [isLoading]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onSignUp: (name, email, password, coords) => print('Lanzado registro'),
        isLoading: state.isLoading,
      );
}
