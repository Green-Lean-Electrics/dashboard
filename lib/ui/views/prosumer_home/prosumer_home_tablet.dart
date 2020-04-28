import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/widgets/charts/chart.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/ratio_chart.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge_panel.dart';
import 'package:flutter/material.dart';

class ProsumerHomeTablet extends StatelessWidget {
  final HomeData homeData;

  ProsumerHomeTablet({@required this.homeData});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GaugePanel(homeData: homeData),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(aspectRatio: 1.6, child: LineChartSample2()),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Row(
            children: <Widget>[
              Container(
                width: constraints.maxWidth * 0.5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatioChart(ratio: 60),
                  ),
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BatteryChart(),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
