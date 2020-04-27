import 'package:dashboard/core/enums/device_screen_type.dart';
import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({
    Key key,
    @required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
        if (mobile != null) {
          return mobile;
        }
      }

      return desktop;
    });
  }
}
