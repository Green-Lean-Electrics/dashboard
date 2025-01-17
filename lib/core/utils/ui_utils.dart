import 'package:dashboard/core/enums/device_screen_type.dart';
import 'package:flutter/material.dart';

class UIUtils {
  static DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    double deviceWidth = mediaQuery.size.width;

    if (deviceWidth > 1400) {
      return DeviceScreenType.Desktop;
    }

    if (deviceWidth > 650) {
      return DeviceScreenType.Tablet;
    }

    return DeviceScreenType.Mobile;
  }
}
