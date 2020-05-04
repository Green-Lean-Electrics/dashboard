import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/loading_locations.dart';
import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/redux/actions/my_gle_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/my_gle/upload_picture_button.dart';
import 'package:flutter/material.dart';

class UploadPictureButtonConnector extends StatelessWidget {
  final MyGLEPictureKind pictureKind;

  UploadPictureButtonConnector({@required this.pictureKind});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(pictureKind: pictureKind),
      builder: (context, model) => UploadPictureButton(
        isLoading: model.isLoading,
        onUpload: model.onUpload,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  final MyGLEPictureKind pictureKind;
  ViewModel({@required this.pictureKind});
  bool isLoading;
  Function(Uint8List) onUpload;

  ViewModel.build({
    @required this.isLoading,
    @required this.onUpload,
    @required this.pictureKind,
  }) : super(equals: [isLoading]);

  @override
  BaseModel fromStore() {
    LoadingLocations location;
    switch (pictureKind) {
      case MyGLEPictureKind.FRONT_YARD:
        location = LoadingLocations.FRONT_YARD_PICTURE;
        break;
      case MyGLEPictureKind.BACK_YARD:
        location = LoadingLocations.BACK_YARD_PICTURE;
        break;
    }
    return ViewModel.build(
      isLoading: state.loadingLocations.contains(location),
      pictureKind: pictureKind,
      onUpload: (file) => dispatch(
        UploadMyGLEPictureAction(picture: file, pictureKind: pictureKind),
      ),
    );
  }
}
