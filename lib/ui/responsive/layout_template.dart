import 'package:dashboard/core/enums/device_screen_type.dart';
import 'package:dashboard/core/redux/connectors/misc/drawer_content.dart';
import 'package:dashboard/core/router.dart';
import 'package:dashboard/core/services/navigation_service.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/widgets/common/top_bar.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {
  final navigatorKey = locator<NavigationService>();
  final String initialRoute;

  LayoutTemplate({@required this.initialRoute});


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? Drawer(child: DrawerContentConnector())
            : null,
        appBar: TopBar(
          appBar: AppBar(),
        ),
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) => Row(
            children: <Widget>[
              ScreenTypeLayout(
                desktop: Container(
                  width: sizingInformation.screenSize.width * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: DrawerContentConnector(),
                ),
                tablet: Container(
                  width: sizingInformation.screenSize.width * 0.08,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: DrawerContentConnector(),
                ),
                mobile: Container(),
              ),
              Expanded(
                child: Navigator(
                  initialRoute: initialRoute,
                  onGenerateRoute: Router.generateRoute,
                  key: navigatorKey.navigatorKey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
