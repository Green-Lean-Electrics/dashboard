import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/charts/indicator.dart';
import 'package:dashboard/ui/widgets/prosumer_home/ratio_selector.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CoalPlantRatioChart extends StatelessWidget {
  final double ratio;
  final bool isCharging;

  CoalPlantRatioChart({@required this.ratio, @required this.isCharging});

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
              title: 'Buffer - Grid ratio',
              trailing: isCharging
                  ? GestureDetector(
                      child: Icon(Icons.settings),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => RatioSelector(
                          isCoalPlant: true,
                          currentRatio: ratio,
                        ),
                      ),
                    )
                  : null,
            ),
            isCharging
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PieChart(
                      dataMap: {
                        'Buffer': this.ratio * 100,
                        'Grid': 100.0 - (this.ratio * 100),
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
                  )
                : AspectRatio(
                    aspectRatio: 1.3,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.power_settings_new, size: 30),
                          Container(
                            width: 0,
                            height: 15,
                          ),
                          Text(
                            'The coal plant isn\'t running',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
            isCharging
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Indicator(
                          color: Color.fromRGBO(5, 247, 150, 1),
                          text: 'Sent to grid',
                          isSquare: false,
                        ),
                        Container(height: 6),
                        Indicator(
                          color: Colors.pink,
                          text: 'Sent to buffer',
                          isSquare: false,
                        ),
                      ],
                    ),
                  )
                : Container(width: 0, height: 0),
          ],
        ),
      ),
    );
  }
}
