import 'package:dashboard/core/models/home_data.dart';
import 'package:dashboard/ui/widgets/customers/mini_gauge.dart';
import 'package:flutter/material.dart';

class MiniGaugePanel extends StatelessWidget {
  final HomeData homeData;

  MiniGaugePanel({@required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MiniGauge(
                  name: 'Wind speed', units: 'm/s', value: homeData.windSpeed),
              MiniGauge(
                  name: 'Temperature',
                  units: 'ºC',
                  value: homeData.temperature),
              MiniGauge(
                name: 'Production',
                units: 'kW',
                value: homeData.electricityProduction,
              ),
              MiniGauge(
                name: 'Consumption',
                units: 'kW',
                value: homeData.electricityConsumption,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MiniGauge(name: 'Market price', units: 'kr/kWh', value: 2.1),
              MiniGauge(
                name: 'Net production',
                units: 'kW',
                value: homeData.electricityProduction -
                    homeData.electricityConsumption,
              ),
              MiniGauge(
                  name: 'Buffer load',
                  units: 'kWh',
                  value: homeData.bufferLoad),
              MiniGauge(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Text(
                      homeData.isSellingBlocked ? 'BLOCKED' : 'ALLOWED',
                      style: TextStyle(
                          color: homeData.isSellingBlocked
                              ? Colors.pink
                              : Color.fromRGBO(5, 247, 150, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
                showDelta: false,
              ),
            ],
          ),
        )
      ],
    );
  }
}
