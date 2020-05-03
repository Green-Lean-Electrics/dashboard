import 'package:flutter/material.dart';

class ChartTitle extends StatelessWidget {
  final String title;
  final Widget trailing;

  ChartTitle({@required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: trailing == null
            ? Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            : Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing
                ],
              ),
      ),
      Divider(),
    ]);
  }
}
