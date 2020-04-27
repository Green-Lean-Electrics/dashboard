import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:logger/logger.dart';

class StateLogger implements StateObserver<AppState> {
  var logger = Logger();

  @override
  void observe(
    ReduxAction<AppState> action,
    AppState stateIni,
    AppState stateEnd,
    int dispatchCount,
  ) {
    logger.i(stateEnd.toString());
  }
}
