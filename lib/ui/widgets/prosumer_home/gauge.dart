import 'package:flutter/material.dart';

class Gauge extends StatelessWidget {
  final String name;
  final String units;
  final double value;

  Gauge({
    @required this.name,
    @required this.units,
    @required this.value,
  });

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
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_drop_up, color: Color.fromRGBO(5, 247, 150, 1)),
                  Text(
                    value.toStringAsFixed(1),
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(' ' + units),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
