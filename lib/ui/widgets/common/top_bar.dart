import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/device_screen_type.dart';
import 'package:dashboard/core/redux/actions/auth_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const TopBar({
    Key key,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (
        context,
        sizingInformation,
      ) =>
          AppBar(
        leading: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : null,
        backgroundColor: Theme.of(context).cardColor,
        title: Text('Green Lean Electrics'),
        actions: <Widget>[
          StoreConnector<AppState, VoidCallback>(
            converter: (store) => () => store.dispatch(LogoutAction()),
            builder: (context, logout) => FlatButton(
              onPressed: () => logout(),
              child: Text('LOGOUT'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
