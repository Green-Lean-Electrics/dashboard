import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/widgets/charts/chart.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/ratio_chart.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge_panel.dart';
import 'package:flutter/material.dart';

class ProsumerHomeMobile extends StatelessWidget {
  final HomeData homeData;

  ProsumerHomeMobile({@required this.homeData});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GaugePanel(homeData: homeData),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LineChartSample2(),
        ),
        AspectRatio(
          aspectRatio: 1.3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatioChart(ratio: 60),
          ),
        ),
        AspectRatio(
          aspectRatio: 0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BatteryChart(),
          ),
        ),
      ],
    );
  }
}