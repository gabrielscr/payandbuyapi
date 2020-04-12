import 'package:flutter/material.dart';
import 'package:payandbuyapp/app/widgets/ui/sizing-info.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) return DeviceScreenType.Desktop;

  if (deviceWidth > 600) return DeviceScreenType.Tablet;

  if (deviceWidth > 400 && deviceWidth < 600)
    return DeviceScreenType.MobileHigh;

  if (deviceWidth > 350 && deviceWidth < 400)
    return DeviceScreenType.MobileMedium;

  if (deviceWidth > 200 && deviceWidth < 350) return DeviceScreenType.MobileLow;

  return DeviceScreenType.MobileHigh;
}
