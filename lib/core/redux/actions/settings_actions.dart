import 'dart:async';
import 'dart:typed_data';
import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/app_state.dart';

class UpdateProfileAction extends ReduxAction<AppState> {
  final String name;
  final String email;
  final String password;
  final Uint8List image;

  UpdateProfileAction({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.image,
  });

  @override
  Future<AppState> reduce() async {
    dispatch(
      StartLoadingAction(loadingLocation: LoadingLocations.SETTINGS_FORM),
    );
    ApiService api = locator<ApiService>();
    User updatedUser = await api.updateProfile(name, email, password, image);

    return state.copy(
      authState: state.authState.copy(
        user: updatedUser,
      ),
    );
  }

  void after() => dispatch(
        EndLoadingAction(loadingLocation: LoadingLocations.SETTINGS_FORM),
      );
}
