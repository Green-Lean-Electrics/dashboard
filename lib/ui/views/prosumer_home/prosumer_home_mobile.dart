import 'package:dashboard/ui/widgets/charts/chart.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/ratio_chart.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge.dart';
import 'package:flutter/material.dart';

class ProsumerHomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            2,
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
            2,
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
            2,
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
            2,
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
