import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/router.dart';

class EnumStrings {
  static Map<MenuOption, String> menuOptions = {
    MenuOption.PROSUMER_HOME: 'Home',
    MenuOption.PROSUMER_MY_GLE: 'My GLE',
    MenuOption.SETTINGS: 'Settings',
    MenuOption.MANAGER_GRID: 'GLE Grid',
    MenuOption.MANAGER_GLE_USERS: 'Customers'
  };

  static Map<MenuOption, String> menuRoutes = {
    MenuOption.PROSUMER_HOME: Router.HOME_ROUTE,
    MenuOption.PROSUMER_MY_GLE: Router.MY_GLE_ROUTE,
    MenuOption.SETTINGS: Router.SETTINGS_ROUTE,
    MenuOption.MANAGER_GRID: Router.GLE_GRID,
    MenuOption.MANAGER_GLE_USERS: Router.GLE_USERS,
  };
}
