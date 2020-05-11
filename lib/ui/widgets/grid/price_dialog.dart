import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/core/utils/validators.dart';
import 'package:dashboard/locator.dart';
import 'package:flutter/material.dart';

class ElectricityPriceDialog extends StatefulWidget {
  final double currenPrice;

  ElectricityPriceDialog({
    @required this.currenPrice,
  });

  @override
  _ElectricityPriceDialogState createState() => _ElectricityPriceDialogState();
}

class _ElectricityPriceDialogState extends State<ElectricityPriceDialog> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPrice;

  @override
  void initState() {
    super.initState();
    _selectedPrice = widget.currenPrice.toStringAsFixed(2);
  }

  @override
  void didUpdateWidget(ElectricityPriceDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedPrice = widget.currenPrice.toStringAsFixed(2);
  }

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
        'GLE\'s grid kWh price',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width:
            mediaQuery.size.width > 1000 ? mediaQuery.size.width * 0.25 : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Select the current price of the electricity for the clients of GLE. '
              'It\'s adiviced to check the estimated price before',
              style: TextStyle(fontSize: 20),
            ),
            Container(width: 0, height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Container(
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'New price',
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      style: TextStyle(fontSize: 20),
                      onChanged: (value) => _selectedPrice = value,
                      initialValue: _selectedPrice,
                      validator: Validators.numberValidator,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'kr/kWh',
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
              "CANCEL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              "CONFIRM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                ApiService api = locator<ApiService>();
                api.setElectricityPrice(double.parse(_selectedPrice.trim()));
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }
}
