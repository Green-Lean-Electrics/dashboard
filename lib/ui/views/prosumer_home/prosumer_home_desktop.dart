import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:dashboard/ui/widgets/charts/chart.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/ratio_chart.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge_panel.dart';
import 'package:flutter/material.dart';

class ProsumerHomeDesktop extends StatelessWidget {
  final HomeData homeData;

  ProsumerHomeDesktop({@required this.homeData});

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
                GaugePanel(homeData: homeData),
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