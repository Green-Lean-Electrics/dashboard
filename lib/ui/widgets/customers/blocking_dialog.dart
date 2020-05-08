import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:flutter/material.dart';

class BlockingDialog extends StatefulWidget {
  final String householdId;

  BlockingDialog({
    @required this.householdId,
  });

  @override
  _BlockingDialogState createState() => _BlockingDialogState();
}

class _BlockingDialogState extends State<BlockingDialog> {
  double _selectedLength = 20;

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
        'Block customer energy sale',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width:
            mediaQuery.size.width > 700 ? mediaQuery.size.width * 0.25 : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'If necessary, you can prevent this client from selling energy to the market '
              'for the selected period of time',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                      value: _selectedLength,
                      activeColor: Colors.pink,
                      onChanged: (value) =>
                          setState(() => _selectedLength = value),
                      max: 100.0,
                      min: 10.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _selectedLength.toStringAsFixed(0) + ' seconds',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            )
          ],
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
              ApiService api = locator<ApiService>();
              api.blockSelling(widget.householdId, _selectedLength.round());
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
