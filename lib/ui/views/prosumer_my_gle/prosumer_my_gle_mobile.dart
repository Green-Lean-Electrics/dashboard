import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/ui/widgets/my_gle/household_picture.dart';
import 'package:dashboard/ui/widgets/my_gle/static_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class ProsumerMyGLEMobile extends StatelessWidget {
  const ProsumerMyGLEMobile({
    Key key,
    @required this.myGLEData,
  }) : super(key: key);

  final MyGLEData myGLEData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HouseholdPicture(
                title: 'Front yard',
                pictureURL: myGLEData.frontPictureURL,
                pictureKind: MyGLEPictureKind.FRONT_YARD,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HouseholdPicture(
                title: 'Back yard',
                pictureURL: myGLEData.backPictureURL,
                pictureKind: MyGLEPictureKind.BACK_YARD,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaticMap(
                location: LatLng(myGLEData.xCoord, myGLEData.yCoord),
              ),
            ),
          )
        ],
      ),
    );
  }
}
