import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/utils/enum_strings.dart';
import 'package:dashboard/ui/responsive/layout_template.dart';
import 'package:dashboard/ui/views/login/login_view.dart';
import 'package:flutter/material.dart';

class AuthEnsurer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserExceptionDialog<AppState>(
      child: StoreConnector<AppState, ViewModel>(
          model: ViewModel(),
          builder: (context, model) {
            if (!model.isAuthenticated) {
              return Navigator(
                  initialRoute: '/',
                  onGenerateRoute: (_) => MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ));
            }
            return LayoutTemplate(
              initialRoute: EnumStrings.menuRoutes[model.currentMenuOption],
            );
          }),
      onShowUserExceptionDialog: (
        BuildContext context,
        UserException userException,
      ) =>
          showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text(
            'Something went wrong',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(userException.msg.replaceAll("Unhandled Failure ", "")),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Close",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  MenuOption currentMenuOption;
  bool isAuthenticated;

  ViewModel.build({
    @required this.currentMenuOption,
    @required this.isAuthenticated,
  }) : super(equals: [isAuthenticated]);

  @override
  BaseModel fromStore() => ViewModel.build(
        currentMenuOption: state.menuOption,
        isAuthenticated: state.authState.isAuthenticated,
      );
}
