import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ProfilePicturePicker extends StatefulWidget {
  final String pictureURL;

  ProfilePicturePicker({@required this.pictureURL});

  @override
  _ProfilePicturePickerState createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker> {
  Image uploadedImage;

  @override
  Widget build(BuildContext context) {
    print('Is null? ' + (uploadedImage == null).toString());
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundImage: uploadedImage != null
                ? uploadedImage.image
                : NetworkImage(widget.pictureURL),
            backgroundColor: Colors.transparent,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () async {
                  Image fromPicker = await ImagePickerWeb.getImage(
                      outputType: ImageType.widget);

                  if (fromPicker != null) {
                    setState(() => uploadedImage = fromPicker);
                  }
                }),
          )
        ],
      ),
    );
  }
}
