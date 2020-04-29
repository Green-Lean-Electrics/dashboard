import 'package:flutter/material.dart';

class Gauge extends StatefulWidget {
  final String name;
  final String units;
  final double value;

  Gauge({
    @required this.name,
    @required this.units,
    @required this.value,
  });

  @override
  _GaugeState createState() => _GaugeState();
}

class _GaugeState extends State<Gauge> {
  double previousValue = 0.0;

  @override
  void didUpdateWidget(Gauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      previousValue = oldWidget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.value > this.previousValue
                      ? Icon(
                          Icons.arrow_drop_up,
                          color: Color.fromRGBO(5, 247, 150, 1),
                        )
                      : Icon(
                          Icons.arrow_drop_down,
                          color: Colors.pink,
                        ),
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
      ),
    );
  }
}
