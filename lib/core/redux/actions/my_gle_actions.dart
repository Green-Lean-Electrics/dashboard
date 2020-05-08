import 'dart:async';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/core/redux/actions/loading_action.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:flutter/cupertino.dart';

class FetchMyGLEDataAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    ApiService apiService = locator<ApiService>();
    MyGLEData data = await apiService.fetchMyGLEData(
      state.authState.user.householdId,
    );
    return state.copy(myGLEData: data);
  }
}

class UploadMyGLEPictureAction extends ReduxAction<AppState> {
  final Uint8List picture;
  final MyGLEPictureKind pictureKind;

  UploadMyGLEPictureAction({
    @required this.picture,
    @required this.pictureKind,
  });

  @override
  Future<AppState> reduce() async {
    switch (pictureKind) {
      case MyGLEPictureKind.FRONT_YARD:
        dispatch(StartLoadingAction(
            loadingLocation: LoadingLocations.FRONT_YARD_PICTURE));
        break;
      case MyGLEPictureKind.BACK_YARD:
        dispatch(StartLoadingAction(
            loadingLocation: LoadingLocations.BACK_YARD_PICTURE));
        break;
    }

    ApiService apiService = locator<ApiService>();
    String newUrl = await apiService.uploadMyGLEPicture(picture, pictureKind);

    switch (pictureKind) {
      case MyGLEPictureKind.FRONT_YARD:
        return state.copy(
          myGLEData: state.myGLEData.copy(frontPictureURL: newUrl),
        );
      case MyGLEPictureKind.BACK_YARD:
        return state.copy(
          myGLEData: state.myGLEData.copy(backPictureURL: newUrl),
        );
    }
    return null;
  }

  void after() {
    switch (pictureKind) {
      case MyGLEPictureKind.FRONT_YARD:
        dispatch(EndLoadingAction(
            loadingLocation: LoadingLocations.FRONT_YARD_PICTURE));
        break;
      case MyGLEPictureKind.BACK_YARD:
        dispatch(EndLoadingAction(
            loadingLocation: LoadingLocations.BACK_YARD_PICTURE));
        break;
    }
  }
}
