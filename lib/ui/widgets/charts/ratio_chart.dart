import 'package:dashboard/core/redux/connectors/misc/ratio_selector.dart';
import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/charts/indicator.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class RatioChart extends StatelessWidget {
  final double ratio;
  final bool isProsuming;

  RatioChart({@required this.ratio, @required this.isProsuming});
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartTitle(
              title: 'Buffer - Market ratio',
              trailing: GestureDetector(
                child: Icon(Icons.settings),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => RatioSelectorConnector(
                    isProsuming: isProsuming,
                    currentRatio: ratio,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PieChart(
                dataMap: {
                  'Buffer': this.ratio * 100,
                  'Market': 100.0 - (this.ratio * 100),
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
                    color: Color.fromRGBO(5, 247, 150, 1),
                    text: this.isProsuming
                        ? 'Selling to market'
                        : 'Buying from market',
                    isSquare: false,
                  ),
                  Container(height: 6),
                  Indicator(
                    color: Colors.pink,
                    text: this.isProsuming
                        ? 'Loading to buffer'
                        : 'Consuming from buffer',
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
