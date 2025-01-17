import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:flutter/material.dart';

class RatioSelector extends StatefulWidget {
  final double currentRatio;
  final bool isProsuming;
  final bool isCoalPlant;

  RatioSelector({
    @required this.currentRatio,
    this.isProsuming,
    this.isCoalPlant = false,
  });

  @override
  _RatioSelectorState createState() => _RatioSelectorState();
}

class _RatioSelectorState extends State<RatioSelector> {
  double _selectedRatio;

  @override
  void initState() {
    super.initState();
    _selectedRatio = widget.currentRatio;
  }

  @override
  void didUpdateWidget(RatioSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedRatio = widget.currentRatio;
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
        widget.isCoalPlant
            ? 'Select buffer - grid ratio'
            : 'Select buffer - market ratio',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: mediaQuery.size.width > 700 ? mediaQuery.size.width * 0.4 : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.isCoalPlant
                ? Text(
                    'Select how much enery you want to send from the coal plant to the grid '
                    'and how much you want to use to load the buffer',
                    style: TextStyle(fontSize: 20),
                  )
                : Text(
                    widget.isProsuming
                        ? 'Your system is producing more energy than needed. Select how much of your '
                            'production you want to use to load the buffer. The rest will be sold to the market'
                        : 'Your system is producing less energy than needed. Select how much of your '
                            'demand you want to take from the buffer (if possible). The rest will be bought from the market',
                    style: TextStyle(fontSize: 20),
                  ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                      value: _selectedRatio,
                      activeColor: Colors.pink,
                      onChanged: (value) =>
                          setState(() => _selectedRatio = value),
                      max: 1.0,
                      min: 0.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    (_selectedRatio * 100).toStringAsFixed(0) + '%',
                    style: TextStyle(fontSize: 25),
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
              if (widget.isCoalPlant) {
                api.setCoalPlantRatio(_selectedRatio);
              } else {
                api.setHouseholdRatio(_selectedRatio);
              }
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
