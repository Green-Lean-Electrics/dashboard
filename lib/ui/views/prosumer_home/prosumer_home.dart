import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_desktop.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_mobile.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_tablet.dart';
import 'package:flutter/material.dart';

class ProsumerHomeView extends StatelessWidget {
  const ProsumerHomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ProsumerHomeMobile(),
      tablet: ProsumerHomeTablet(),
      desktop: ProsumerHomeDesktop(),
    );
  }
}
