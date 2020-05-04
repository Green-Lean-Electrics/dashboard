import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/views/prosumer_my_gle/prosumer_my_gle_desktop.dart';
import 'package:dashboard/ui/views/prosumer_my_gle/prosumer_my_gle_mobile.dart';
import 'package:dashboard/ui/views/prosumer_my_gle/prosumer_my_gle_tablet.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:flutter/material.dart';

class ProsumerMyGLEView extends StatelessWidget {
  final MyGLEData myGLEData;

  ProsumerMyGLEView({@required this.myGLEData});

  @override
  Widget build(BuildContext context) {
    if (myGLEData == null) {
      return Center(
        child: GreenLeanProgressIndicator(),
      );
    }

    return ScreenTypeLayout(
      mobile: ProsumerMyGLEMobile(myGLEData: myGLEData),
      tablet: ProsumerMyGLETablet(myGLEData: myGLEData),
      desktop: ProsumerMyGLEDesktop(myGLEData: myGLEData),
    );
  }
}