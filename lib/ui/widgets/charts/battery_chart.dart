import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/charts/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BatteryChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChartTitle(title: 'Buffer load'),
            Container(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 100,
                    minY: 0,
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(showTitles: false),
                      leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 16,
                          getTitles: (value) {
                            if (value.toInt() % 20 == 0) {
                              return value.toInt().toString() + '%';
                            } else {
                              return '';
                            }
                          }),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            y: 80,
                            color: Color.fromRGBO(5, 247, 150, 1),
                            width: 60,
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              y: 100,
                              color: Color.fromRGBO(5, 247, 150, 0.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Indicator(
                color: Color.fromRGBO(5, 247, 150, 1),
                text: 'Current buffer load',
                isSquare: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}