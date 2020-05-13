import 'dart:convert';

import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_desktop.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_mobile.dart';
import 'package:dashboard/ui/views/prosumer_home/prosumer_home_tablet.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/html.dart';

class ProsumerHomeView extends StatefulWidget {
  final String householdId;
  final String token;

  ProsumerHomeView({
    Key key,
    @required this.householdId,
    @required this.token,
  }) : super(key: key);

  @override
  _ProsumerHomeViewState createState() => _ProsumerHomeViewState();
}

class _ProsumerHomeViewState extends State<ProsumerHomeView> {
  final channel = HtmlWebSocketChannel.connect(
    "wss://pure-badlands-64215.herokuapp.com",
  );

  @override
  void initState() {
    print('PASO POR AQUÍ');
    Map<String, dynamic> authObject = {
      'householdId': widget.householdId,
      'token': widget.token,
    };
    channel.sink.add(json.encode(authObject));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Y POR AQUÍ');
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        HomeData homeData = snapshot.hasData
            ? HomeData.fromJson(json.decode(snapshot.data))
            : HomeData.emptyData();
        return ScreenTypeLayout(
          mobile: ProsumerHomeMobile(homeData: homeData),
          tablet: ProsumerHomeTablet(homeData: homeData),
          desktop: ProsumerHomeDesktop(homeData: homeData),
        );
      },
    );
  }
}
