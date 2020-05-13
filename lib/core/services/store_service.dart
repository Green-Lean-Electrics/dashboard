import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
//import 'package:dashboard/core/redux/state_logger.dart';
import 'package:dashboard/core/services/green_persistor.dart';

class StoreService {
  Store _store;

  Future<void> _initiStore() async {
    var persistor = GreenPersistor();

    var initialState = await persistor.readState();

    if (initialState == null) {
      initialState = AppState.initialAppState();
      await persistor.saveInitialState(initialState);
    }

    _store = Store<AppState>(
      initialState: initialState,
      persistor: persistor,
      //actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
      //stateObservers: [StateLogger()],
    );
  }

  Future<Store<AppState>> getStore() async {
    if (_store == null) {
      await _initiStore();
    }
    return _store;
  }
}
