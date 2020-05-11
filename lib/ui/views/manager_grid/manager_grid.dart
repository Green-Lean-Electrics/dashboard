import 'dart:convert';

import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/views/manager_grid/manager_grid_desktop.dart';
import 'package:dashboard/ui/views/manager_grid/manager_grid_mobile.dart';
import 'package:dashboard/ui/views/manager_grid/manager_grid_tablet.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/html.dart';

class ManagerGridView extends StatefulWidget {
  final String token;

  ManagerGridView({@required this.token});

  @override
  _ManagerGridViewState createState() => _ManagerGridViewState();
}

class _ManagerGridViewState extends State<ManagerGridView> {
  final channel = HtmlWebSocketChannel.connect(
    "wss://pure-badlands-64215.herokuapp.com",
  );

  @override
  void initState() {
    Map<String, dynamic> authObject = {
      'householdId': 'COAL_PLANT',
      'token': widget.token,
    };
    channel.sink.add(json.encode(authObject));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        GridData gridData = snapshot.hasData
            ? GridData.fromJson(json.decode(snapshot.data))
            : GridData.emptyData();
        return ScreenTypeLayout(
          mobile: ManagerGridMobile(gridData: gridData),
          tablet: ManagerGridTablet(gridData: gridData),
          desktop: ManagerGridDesktop(gridData: gridData),
        );
      },
    );
  }
}
