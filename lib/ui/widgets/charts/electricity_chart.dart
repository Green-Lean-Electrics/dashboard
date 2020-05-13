import 'dart:math';
import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ElectricityChart extends StatefulWidget {
  final double lastValue;
  final String title;
  final int numLabels;
  final bool useGreen;

  ElectricityChart(
      {@required this.lastValue,
      @required this.title,
      this.numLabels = 4,
      this.useGreen = false});

  @override
  _ElectricityChartState createState() => _ElectricityChartState();
}

class _ElectricityChartState extends State<ElectricityChart> {
  List<double> values = [0.0];
  List<DateTime> timestamps = [DateTime.now()];

  double minValue = 0, maxValue = 1;

  Map<String, String> labels = {};

  final List<Color> pinkGradient = [
    Colors.pink,
    Colors.pink[300],
  ];

  final List<Color> greenGradient = [
    Color.fromRGBO(5, 247, 150, 1),
    Color.fromRGBO(5, 247, 150, 0.5)
  ];

  Map<String, String> generateLabels(double min, double max) {
    double segmentLength = (max - min) / (widget.numLabels + 1);
    double normalizedsegmentLength = 2 / (widget.numLabels + 1);

    Map<String, String> output = {};
    for (int i = 1; i <= widget.numLabels; i++) {
      output[(-0.5 + (normalizedsegmentLength * i)).toStringAsFixed(1)] =
          (min + (segmentLength * i))
              .toStringAsFixed(min > 100 || max < -100 ? 0 : 1);
    }
    return output;
  }

  @override
  void didUpdateWidget(ElectricityChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    values.add(widget.lastValue);
    timestamps.add(DateTime.now());

    if (values.length > 12) {
      values = values.sublist(1, 13);
      timestamps = timestamps.sublist(1, 13);
    }

    minValue = values.reduce(min);
    maxValue = values.reduce(max);
    labels = generateLabels(minValue, maxValue);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18.0,
          left: 12.0,
          top: 24,
          bottom: 12,
        ),
        child: Column(
          children: <Widget>[
            ChartTitle(title: widget.title),
            Container(height: 20),
            Expanded(child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: constraints.maxWidth,
                width: constraints.maxWidth,
                child: LineChart(mainData()),
              );
            }))
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        horizontalInterval: 0.1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            int position = value.toInt();
            if ([2, 5, 8].contains(position)) {
              if (timestamps.length > position) {
                return DateFormat('HH:mm:ss').format(timestamps[position]);
              }
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          interval: 0.1,
          getTitles: (value) {
            if (labels[value.toStringAsFixed(1)] != null) {
              return labels[value.toStringAsFixed(1)];
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: -0.5,
      maxY: 1.5,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            values.length,
            (index) {
              double normalizedValue;
              if (maxValue - minValue != 0) {
                normalizedValue =
                    (values[index] - minValue) / (maxValue - minValue);
              } else {
                normalizedValue = 0.5;
              }
              return FlSpot(index.toDouble(), normalizedValue);
            },
          ),
          isCurved: true,
          colors: widget.useGreen ? greenGradient : pinkGradient,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: (widget.useGreen ? greenGradient : pinkGradient)
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ],
    );
  }
}
