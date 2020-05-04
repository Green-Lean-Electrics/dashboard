import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/ui/widgets/my_gle/household_picture.dart';
import 'package:dashboard/ui/widgets/my_gle/static_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class ProsumerMyGLEDesktop extends StatelessWidget {
  const ProsumerMyGLEDesktop({
    Key key,
    @required this.myGLEData,
  }) : super(key: key);

  final MyGLEData myGLEData;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HouseholdPicture(
                      title: 'Frontyard',
                      pictureURL: myGLEData.frontPictureURL,
                      pictureKind: MyGLEPictureKind.FRONT_YARD,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HouseholdPicture(
                      title: 'Back yard',
                      pictureURL: myGLEData.backPictureURL,
                      pictureKind: MyGLEPictureKind.BACK_YARD,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.55,
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
