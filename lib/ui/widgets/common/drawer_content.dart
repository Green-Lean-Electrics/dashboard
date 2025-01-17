import 'package:dashboard/core/enums/menu_options.dart';
import 'package:dashboard/core/enums/user_role.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/services/navigation_service.dart';
import 'package:dashboard/core/utils/enum_strings.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/shared/green_lean_icons.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  final MenuOption currentMenuOption;
  final Function(MenuOption) onMenuSelected;
  final User user;

  DrawerContent({
    @required this.currentMenuOption,
    @required this.onMenuSelected,
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              buildAvatar(),
              ...buildMenuOptions(context, user.role),
              buildTile(context, MenuOption.SETTINGS, Icons.settings),
            ],
          ),
        ),
        buildSignature(),
      ],
    );
  }

  List<Widget> buildMenuOptions(BuildContext context, UserRole role) {
    switch (role) {
      case UserRole.PROSUMER_ROLE:
        return [
          buildTile(context, MenuOption.PROSUMER_HOME, Icons.dashboard),
          buildTile(context, MenuOption.PROSUMER_MY_GLE, GreenLean.turbine),
        ];
      case UserRole.MANAGER_ROLE:
        return [
          buildTile(context, MenuOption.MANAGER_GRID, Icons.grid_on),
          buildTile(context, MenuOption.MANAGER_GLE_USERS, Icons.people),
        ];
    }
    return [];
  }

  Widget buildTile(
      BuildContext context, MenuOption menuOption, IconData iconData) {
    Widget reduced = Column(children: [
      Container(height: 20),
      menuOption == this.currentMenuOption
          ? Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(5, 247, 150, 0.2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconData, size: 35),
              ),
            )
          : Icon(iconData, size: 45)
    ]);

    Widget expanded = menuOption == this.currentMenuOption
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(5, 247, 150, 0.2),
                  borderRadius: BorderRadius.circular(30.0)),
              child: ListTile(
                leading: Icon(iconData, size: 40),
                title: Text(
                  EnumStrings.menuOptions[menuOption],
                  style: TextStyle(
                    color: Color.fromRGBO(5, 247, 150, 1),
                  ),
                ),
              ),
            ),
          )
        : ListTile(
            leading: Icon(iconData, size: 40),
            title: Text(EnumStrings.menuOptions[menuOption]),
          );
    return GestureDetector(
      onTap: () {
        final navigatorKey = locator<NavigationService>();
        onMenuSelected(menuOption);
        navigatorKey.navigateTo(EnumStrings.menuRoutes[menuOption]);
      },
      child: ScreenTypeLayout(
        mobile: expanded,
        tablet: reduced,
        desktop: expanded,
      ),
    );
  }

  Widget buildAvatar() {
    String pictureURL =
        'https://pure-badlands-64215.herokuapp.com' + user.profilePictureURL;
    Widget reduced = Column(
      children: <Widget>[
        Container(height: 30),
        CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(pictureURL),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
    Widget expanded = Column(
      children: <Widget>[
        Container(height: 30),
        ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(pictureURL),
            backgroundColor: Colors.transparent,
          ),
          title: Text(user.name),
          subtitle: Text(user.email),
        ),
        Divider(),
      ],
    );

    return ScreenTypeLayout(
      mobile: expanded,
      tablet: reduced,
      desktop: expanded,
    );
  }

  Widget buildSignature() {
    Widget reduced = Column(
      children: <Widget>[
        Icon(GreenLean.power, size: 45),
        Container(height: 10),
      ],
    );

    Widget expanded = Column(children: <Widget>[
      Divider(),
      ListTile(
        leading: Icon(
          GreenLean.power,
          size: 40,
        ),
        title: Text('Green Lean Dashboard'),
        subtitle: Text('v. 1.0.0'),
      )
    ]);

    return ScreenTypeLayout(
      mobile: expanded,
      tablet: reduced,
      desktop: expanded,
    );
  }
}
