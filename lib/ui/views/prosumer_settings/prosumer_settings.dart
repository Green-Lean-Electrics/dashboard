import 'package:flutter/material.dart';

class ProsumerSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(Icons.settings, size: 40),
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
