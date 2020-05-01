import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ElectricityChart extends StatefulWidget {
  final double lastValue;

  ElectricityChart({@required this.lastValue});

  @override
  _ElectricityChartState createState() => _ElectricityChartState();
}

class _ElectricityChartState extends State<ElectricityChart> {
  List<double> values = [0.0];

  final List<Color> gradientColors = [
    Colors.pink,
    Colors.pink[300],
  ];

  @override
  void didUpdateWidget(ElectricityChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    values.add(widget.lastValue);
    if (values.length > 15) {
      values = values.sublist(1, 16);
    }
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
            ChartTitle(title: 'Buffer load'),
            Container(height: 20),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return AspectRatio(
                  aspectRatio: constraints.maxWidth / constraints.maxHeight,
                  child: LineChart(mainData()),
                );
              }),
            ),
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
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
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
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
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
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            values.length,
            (index) => FlSpot(index.toDouble(), values[index]),
          ),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
