import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/coal_ratio_chart.dart';
import 'package:dashboard/ui/widgets/charts/electricity_chart.dart';
import 'package:dashboard/ui/widgets/grid/blackout_list.dart';
import 'package:dashboard/ui/widgets/grid/coal_plant_state.dart';
import 'package:dashboard/ui/widgets/grid/gauge_panel.dart';
import 'package:flutter/material.dart';

class ManagerGridTablet extends StatelessWidget {
  final GridData gridData;

  ManagerGridTablet({@required this.gridData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          GaugePanel(gridData: gridData),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                CoalPlantStateDisplay(coalPlantState: gridData.coalPlantState),
          ),
          AspectRatio(
            aspectRatio: 1.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElectricityChart(
                lastValue: gridData.bufferLoad,
                title: 'Buffer load (kWh)',
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElectricityChart(
                lastValue: gridData.totalDemand,
                title: 'Grid demand (kW)',
                useGreen: true,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Row(
              children: <Widget>[
                Container(
                  width: constraints.maxWidth * 0.5,
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CoalPlantRatioChart(
                        ratio: gridData.ratio,
                        isCharging:
                            gridData.coalPlantState == CoalPlantState.RUNNING,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.5,
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BatteryChart(
                        bufferLoad: gridData.bufferLoad,
                        isCoalPlant: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlackoutList(blackouts: gridData.blackouts),
            ),
          )
        ],
      ),
    );
  }
}
