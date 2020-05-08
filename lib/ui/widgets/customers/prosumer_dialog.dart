import 'dart:convert';

import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/widgets/customers/mini_gauge_panel.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/html.dart';

class ProsumerSystemDialog extends StatefulWidget {
  final String username;
  final String householdId;
  final String token;

  ProsumerSystemDialog({
    @required this.username,
    @required this.householdId,
    @required this.token,
  });

  @override
  _ProsumerSystemDialogState createState() => _ProsumerSystemDialogState();
}

class _ProsumerSystemDialogState extends State<ProsumerSystemDialog> {
  final channel = HtmlWebSocketChannel.connect(
    "wss://pure-badlands-64215.herokuapp.com",
  );

  @override
  void initState() {
    Map<String, dynamic> authObject = {
      'householdId': widget.householdId,
      'token': widget.token,
    };
    channel.sink.add(json.encode(authObject));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        widget.username + '\'s system',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: StreamBuilder(
        stream: channel.stream,
        builder: (builder, snapshot) {
          HomeData homeData = snapshot.hasData
              ? HomeData.fromJson(json.decode(snapshot.data))
              : HomeData.emptyData();

          return MiniGaugePanel(homeData: homeData);
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              "CLOSE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
