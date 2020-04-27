import 'package:flutter/material.dart';

class ChartTitle extends StatelessWidget {
  final String title;

  ChartTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
         title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Divider(),
    ]);
  }
}
