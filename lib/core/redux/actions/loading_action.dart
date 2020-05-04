import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';

class StartLoadingAction extends ReduxAction<AppState> {
  final LoadingLocations loadingLocation;

  StartLoadingAction({@required this.loadingLocation});

  @override
  AppState reduce() {
    return state.copy(
      loadingLocations: Set.of(
        state.loadingLocations..add(loadingLocation),
      ),
    );
  }
}

class EndLoadingAction extends ReduxAction<AppState> {
  final LoadingLocations loadingLocation;

  EndLoadingAction({@required this.loadingLocation});

  @override
  AppState reduce() {
    return state.copy(
      loadingLocations: Set.of(
        state.loadingLocations..remove(loadingLocation),
      ),
    );
  }
}
