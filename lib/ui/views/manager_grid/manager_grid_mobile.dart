import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/coal_ratio_chart.dart';
import 'package:dashboard/ui/widgets/charts/electricity_chart.dart';
import 'package:dashboard/ui/widgets/grid/blackout_list.dart';
import 'package:dashboard/ui/widgets/grid/coal_plant_state.dart';
import 'package:dashboard/ui/widgets/grid/gauge_panel.dart';
import 'package:flutter/material.dart';

class ManagerGridMobile extends StatelessWidget {
  final GridData gridData;

  ManagerGridMobile({@required this.gridData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: <Widget>[
        GaugePanel(gridData: gridData),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CoalPlantStateDisplay(coalPlantState: gridData.coalPlantState),
        ),
        AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElectricityChart(
              lastValue: gridData.bufferLoad,
              title: 'Buffer load (kWh)',
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElectricityChart(
              lastValue: gridData.totalDemand,
              title: 'Grid demand (kW)',
              useGreen: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CoalPlantRatioChart(
            ratio: gridData.ratio,
            isCharging: gridData.coalPlantState == CoalPlantState.RUNNING,
          ),
        ),
        AspectRatio(
          aspectRatio: 0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BatteryChart(bufferLoad: gridData.bufferLoad),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlackoutList(blackouts: gridData.blackouts),
          ),
        )
      ]),
    );
  }
}
