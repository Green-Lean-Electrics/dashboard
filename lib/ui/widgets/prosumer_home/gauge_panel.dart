import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge.dart';
import 'package:flutter/material.dart';

class GaugePanel extends StatelessWidget {
  final HomeData homeData;

  GaugePanel({@required this.homeData});

  @override
  Widget build(BuildContext context) {
    List<Gauge> gauges = [
      Gauge(name: 'Wind speed', units: 'm/s', value: homeData.windSpeed),
      Gauge(name: 'Temperature', units: 'ºC', value: homeData.temperature),
      Gauge(
        name: 'Production',
        units: 'kW',
        value: homeData.electricityProduction,
      ),
      Gauge(
        name: 'Consumption',
        units: 'kW',
        value: homeData.electricityConsumption,
      ),
      Gauge(name: 'Market price', units: 'kr/kWh', value: 2.1),
      Gauge(
        name: 'Net production',
        units: 'kW',
        value: homeData.electricityProduction - homeData.electricityConsumption,
      ),
      Gauge(name: 'Buffer load', units: 'kWh', value: homeData.bufferLoad),
      Gauge(
        name: 'Selling to market',
        units: '',
        auxWidget: Container(
          decoration: BoxDecoration(
            color: homeData.isSellingBlocked
                  ? Colors.pink.withOpacity(0.3)
                  : Color.fromRGBO(5, 247, 150, 0.2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Text(
              homeData.isSellingBlocked ? 'BLOCKED' : 'ALLOWED',
              style: TextStyle(
                  color: homeData.isSellingBlocked
                      ? Colors.pink
                      : Color.fromRGBO(5, 247, 150, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        showDelta: false,
      ),
    ];

    return ScreenTypeLayout(
      mobile: Column(
        children: List.generate(
          gauges.length ~/ 2,
          (columnIndex) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (rowIndex) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gauges[2 * columnIndex + rowIndex],
                ),
              ),
            ),
          ),
        ),
      ),
      desktop: Column(
        children: List.generate(
          2,
          (columnIndex) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              gauges.length ~/ 2,
              (rowIndex) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gauges[columnIndex + 2 * rowIndex],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
