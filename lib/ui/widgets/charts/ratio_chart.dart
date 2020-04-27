import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/charts/indicator.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class RatioChart extends StatelessWidget {
  final double ratio;

  RatioChart({@required this.ratio});
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartTitle(title: 'Buffer - Market ratio'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PieChart(
                dataMap: {
                  'To buffer': this.ratio,
                  'To market': 100.0 - this.ratio,
                },
                chartRadius: 140,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32.0,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: [Colors.pink, Color.fromRGBO(5, 247, 150, 1)],
                showLegends: false,
                decimalPlaces: 0,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.ring,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Indicator(
                    color: Colors.pink,
                    text: 'Selling to market',
                    isSquare: false,
                  ),
                  Container(height: 6),
                  Indicator(
                    color: Color.fromRGBO(5, 247, 150, 1),
                    text: 'Loading to buffer',
                    isSquare: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
