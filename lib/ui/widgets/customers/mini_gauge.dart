import 'package:flutter/material.dart';

class MiniGauge extends StatefulWidget {
  final String name;
  final String units;
  final double value;
  final bool showDelta;
  final Widget auxWidget;

  MiniGauge({
    @required this.name,
    @required this.units,
    this.value,
    this.auxWidget,
    this.showDelta = true,
  });

  @override
  _MiniGaugeState createState() => _MiniGaugeState();
}

class _MiniGaugeState extends State<MiniGauge> {
  double previousValue = 0.0;

  @override
  void didUpdateWidget(MiniGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      previousValue = oldWidget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(height: 4),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.showDelta
                    ? widget.value > this.previousValue
                        ? Icon(
                            Icons.arrow_drop_up,
                            color: Color.fromRGBO(5, 247, 150, 1),
                          )
                        : Icon(
                            Icons.arrow_drop_down,
                            color: Colors.pink,
                          )
                    : Container(width: 0, height: 0),
                widget.auxWidget ??
                    Text(
                      widget.value.toStringAsFixed(1),
                      style: TextStyle(fontSize: 30),
                    ),
                Text(' ' + widget.units),
              ],
            ),
          )
        ],
      ),
    );
  }
}
