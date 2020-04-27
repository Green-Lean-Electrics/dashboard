import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/router.dart';

class EnumStrings {
  static Map<MenuOption, String> menuOptions = {
    MenuOption.PROSUMER_HOME : 'Home',
    MenuOption.PROSUMER_MY_GLE : 'My GLE',
    MenuOption.PROSUMER_SETTINGS : 'Settings',
  };

  static Map<MenuOption, String> menuRoutes = {
    MenuOption.PROSUMER_HOME : Router.HOME_ROUTE,
    MenuOption.PROSUMER_MY_GLE : Router.MY_GLE_ROUTE,
    MenuOption.PROSUMER_SETTINGS : Router.SETTINGS_ROUTE,
  };  
}