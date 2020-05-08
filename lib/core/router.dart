import 'package:dashboard/core/redux/connectors/customers/manager_customer.dart';
import 'package:dashboard/core/redux/connectors/my_gle/my_gle.dart';
import 'package:dashboard/core/redux/connectors/prosumer_home.dart';
import 'package:dashboard/ui/views/prosumer_settings/prosumer_settings.dart';
import 'package:flutter/material.dart';

class Router {
  static const String HOME_ROUTE = '/';
  static const String LOGIN_ROUTE = '/login';
  static const String MY_GLE_ROUTE = '/myGLE';
  static const String SETTINGS_ROUTE = '/settings';
  static const String GLE_GRID = '/grid';
  static const String GLE_USERS = '/users';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Enrutando ' + settings.name);
    switch (settings.name) {
      case HOME_ROUTE:
        return _getPageRoute(ProsumerHomeViewConnector());
      case MY_GLE_ROUTE:
        return _getPageRoute(ProsumerMyGLEViewConnector());
      case SETTINGS_ROUTE:
        return _getPageRoute(ProsumerSettingsView());
      case GLE_USERS:
        return _getPageRoute(ManagerCustomersViewConnector());
      default:
        return _getPageRoute(
            Center(child: Text('Unknown route: ' + settings.name)));
    }
  }

  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
