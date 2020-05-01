import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/actions/settings_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/settings/settings_form.dart';
import 'package:flutter/material.dart';

class SettingsFormConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => SettingsForm(
        currentUser: model.currentUser,
        onUserUpdated: model.onProfileUpdate,
        isLoading: model.isLoading,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  User currentUser;
  Function(String, String, String, Uint8List) onProfileUpdate;
  bool isLoading;

  ViewModel.build(
      {@required this.currentUser,
      @required this.onProfileUpdate,
      @required this.isLoading})
      : super(equals: [currentUser, isLoading]);

  @override
  BaseModel fromStore() => ViewModel.build(
        currentUser: state.authState.user,
        onProfileUpdate: (name, email, password, image) => dispatch(
          UpdateProfileAction(
            name: name,
            email: email,
            password: password,
            image: image,
          ),
        ),
        isLoading: state.isLoading,
      );
}
