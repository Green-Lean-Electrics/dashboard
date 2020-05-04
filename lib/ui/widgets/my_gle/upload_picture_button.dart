import 'dart:typed_data';

import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class UploadPictureButton extends StatelessWidget {
  final bool isLoading;
  final Function(Uint8List) onUpload;

  UploadPictureButton({
    @required this.isLoading,
    @required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return GreenLeanProgressIndicator(size: 30);
    }
    return GestureDetector(
      child: Icon(Icons.add_a_photo),
      onTap: () async {
        Uint8List fromPicker = await ImagePickerWeb.getImage(
          outputType: ImageType.bytes,
        );
        if (fromPicker != null) {
          onUpload(fromPicker);
        }
      },
    );
  }
}
