import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/redux/connectors/misc/auth_ensurer.dart';
import 'package:dashboard/core/services/store_service.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/ui/shared/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  setupLocator();

  Store<AppState> store = await locator<StoreService>().getStore();

  runApp(StoreProvider<AppState>(
    child: GreenLeanDashboard(),
    store: store,
  ));
}

class GreenLeanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Lean Electrics',
      theme: greenLeanTheme,
      home: AuthEnsurer(),
    );
  }
}
