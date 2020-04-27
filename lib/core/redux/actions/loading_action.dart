import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';

class SetLoadingAction extends ReduxAction<AppState> {
  final bool isLoading;

  SetLoadingAction({@required this.isLoading});

  @override
  AppState reduce() {
    return state.copy(isLoading: isLoading);
  }
}
