import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/redux/connectors/misc/auth_ensurer.dart';
import 'package:dashboard/core/redux/state_logger.dart';
import 'package:dashboard/core/services/green_persistor.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/ui/shared/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  setupLocator();

  var persistor = GreenPersistor();

  var initialState = await persistor.readState();

  if (initialState == null) {
    initialState = AppState.initialAppState();
    await persistor.saveInitialState(initialState);
  }

  final Store store = Store<AppState>(
    initialState: initialState,
    persistor: persistor,
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
    stateObservers: [StateLogger()],
  );

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
