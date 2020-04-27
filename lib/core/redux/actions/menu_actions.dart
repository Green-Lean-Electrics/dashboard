import 'package:dashboard/core/utils/enum_strings.dart';
import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/redux/app_state.dart';

class SelectMenuAction extends ReduxAction<AppState> {
  final MenuOption menuOption;

  SelectMenuAction({@required this.menuOption});

  @override
  AppState reduce() {
    //NavigateAction<AppState>.pushNamed(EnumStrings.menuRoutes[menuOption]);
    return state.copy(menuOption: menuOption);
  }
}
