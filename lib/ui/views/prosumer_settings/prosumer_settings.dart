import 'package:dashboard/core/redux/connectors/settings/settings_form.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

class ProsumerSettingsView extends StatefulWidget {
  @override
  _ProsumerSettingsViewState createState() => _ProsumerSettingsViewState();
}

class _ProsumerSettingsViewState extends State<ProsumerSettingsView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: Center(
        child: SettingsFormConnector(),
      ),
      mobile: ListView(children: <Widget>[
        Center(
          child: SettingsFormConnector(),
        )
      ]),
    );
  }
}
