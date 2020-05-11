import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/views/manager_grid/manager_grid.dart';
import 'package:flutter/material.dart';

class ManagerGridViewConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.authState.token,
      builder: (context, token) => ManagerGridView(
        token: token,
      ),
    );
  }
}
