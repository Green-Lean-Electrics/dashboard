import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:dashboard/ui/widgets/charts/chart.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/ratio_chart.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge.dart';
import 'package:flutter/material.dart';

class ProsumerHomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Gauge(
                          name: 'Temperature',
                          units: 'ºC',
                          value: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Gauge(
                          name: 'Temperature',
                          units: 'ºC',
                          value: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChartSample2(),
                  ),
                )
              ],
            )),
            Container(
              width: sizingInformation.screenSize.width * 0.15,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatioChart(ratio: 60),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BatteryChart(),
                    ),
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
