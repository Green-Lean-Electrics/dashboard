import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';

class RatioSelectionAction extends ReduxAction<AppState> {
  final double newRatio;

  RatioSelectionAction({@required this.newRatio});

  @override
  Future<AppState> reduce() async {
    dispatch(StartLoadingAction(loadingLocation: LoadingLocations.RATIO_SELECTION));
    ApiService api = locator<ApiService>();
    await api.setHouseholdRatio(newRatio);
    return null;
  }

  void after() => dispatch(EndLoadingAction(loadingLocation: LoadingLocations.RATIO_SELECTION));
  
}