import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String username;
  final Function onUserDelete;

  DeleteDialog({
    @required this.username,
    @required this.onUserDelete,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        'Delete ' + username + '\'s account ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width:
            mediaQuery.size.width > 900 ? mediaQuery.size.width * 0.25 : null,
        child: Text(
          'Are you sure about deleting ' +
              username +
              '\'s account? This process can not be undone. '
                  'All de data regarding ' +
              username +
              '\'s account will be deleted from GLE\'s systems',
          style: TextStyle(fontSize: 20),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              "CONFIRM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              onUserDelete();
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              "CANCEL",
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
