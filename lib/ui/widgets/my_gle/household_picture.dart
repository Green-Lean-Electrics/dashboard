import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/redux/connectors/my_gle/upload_picture_button.dart';
import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:flutter/material.dart';

class HouseholdPicture extends StatelessWidget {
  final String title;
  final String pictureURL;
  final MyGLEPictureKind pictureKind;

  HouseholdPicture({
    @required this.title,
    @required this.pictureURL,
    @required this.pictureKind,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ChartTitle(
              title: title,
              trailing: UploadPictureButtonConnector(pictureKind: pictureKind),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: pictureURL != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://pure-badlands-64215.herokuapp.com' + pictureURL,
                        ),
                      )
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.broken_image, size: 30),
                            Container(
                              width: 0,
                              height: 15,
                            ),
                            Text(
                              'You haven\'t added a picture yet',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
