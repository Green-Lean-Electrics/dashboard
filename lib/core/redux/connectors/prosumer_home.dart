import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home.dart';
import 'package:flutter/material.dart';

class ProsumerHomeViewConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => ProsumerHomeView(
        householdId: model.householdId,
        token: model.token,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  String householdId;
  String token;

  ViewModel.build({
    @required this.householdId,
    @required this.token,
  }) : super(equals: [householdId, token]);

  @override
  BaseModel fromStore() => ViewModel.build(
        householdId: state.authState.user.householdId,
        token: state.authState.token,
      );
}
