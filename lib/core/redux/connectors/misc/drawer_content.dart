import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/actions/menu_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/common/drawer_content.dart';
import 'package:flutter/material.dart';

class DrawerContentConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => DrawerContent(
        currentMenuOption: model.currentMenuOption,
        onMenuSelected: model.onMenuSelected,
        user: model.user,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  MenuOption currentMenuOption;
  Function(MenuOption) onMenuSelected;
  User user;

  ViewModel.build({
    @required this.currentMenuOption,
    @required this.onMenuSelected,
    @required this.user,
  }) : super(equals: [user, currentMenuOption]);

  @override
  BaseModel fromStore() => ViewModel.build(
        currentMenuOption: state.menuOption,
        onMenuSelected: (menuOption) => dispatch(
          SelectMenuAction(menuOption: menuOption),
        ),
        user: state.authState.user,
      );
}
