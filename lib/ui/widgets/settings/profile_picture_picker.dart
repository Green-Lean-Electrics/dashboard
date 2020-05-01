import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ProfilePicturePicker extends StatefulWidget {
  final String pictureURL;
  final Function(Uint8List) onImageUpdated;

  ProfilePicturePicker({
    @required this.pictureURL,
    @required this.onImageUpdated,
  });

  @override
  _ProfilePicturePickerState createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker> {
  Uint8List uploadedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundImage: uploadedImage != null
                ? MemoryImage(uploadedImage)
                : NetworkImage(widget.pictureURL),
            backgroundColor: Colors.transparent,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () async {
                  Uint8List fromPicker = await ImagePickerWeb.getImage(
                    outputType: ImageType.bytes,
                  );

                  if (fromPicker != null) {
                    setState(() => uploadedImage = fromPicker);
                    widget.onImageUpdated(fromPicker);
                  }
                }),
          )
        ],
      ),
    );
  }
}
