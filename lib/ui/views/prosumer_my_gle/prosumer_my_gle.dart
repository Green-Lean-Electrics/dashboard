import 'package:flutter/material.dart';

class ProsumerMyGLEView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(Icons.build, size: 40),
        title: Text(
          'My GLE',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
