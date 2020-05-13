import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/widgets/grid/price_dialog.dart';
import 'package:dashboard/ui/widgets/prosumer_home/gauge.dart';
import 'package:flutter/material.dart';

class GaugePanel extends StatelessWidget {
  final GridData gridData;

  GaugePanel({@required this.gridData});

  @override
  Widget build(BuildContext context) {
    List<Gauge> gauges = [
      Gauge(
        name: 'Fixed price',
        units: 'kr/kWh',
        value: gridData.realPrice,
        trailing: GestureDetector(
          child: Icon(Icons.settings),
          onTap: () => showDialog(
              context: context,
              builder: (context) => ElectricityPriceDialog(
                    currenPrice: gridData.realPrice,
                  )),
        ),
      ),
      Gauge(
        name: 'Modeled price',
        units: 'kr/kWh',
        value: gridData.estimatedPrice,
      ),
      Gauge(name: 'Grid demand', units: 'kW', value: gridData.totalDemand),
      Gauge(
        name: 'Coal plant production',
        units: 'kW',
        value: gridData.coalPlantProduction,
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
      tablet: Column(
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
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          gauges.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: gauges[index],
            ),
          ),
        ),
      ),
    );
  }
}
