import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/responsive/responsive_builder.dart';
import 'package:dashboard/ui/widgets/charts/battery_chart.dart';
import 'package:dashboard/ui/widgets/charts/coal_ratio_chart.dart';
import 'package:dashboard/ui/widgets/charts/electricity_chart.dart';
import 'package:dashboard/ui/widgets/grid/blackout_list.dart';
import 'package:dashboard/ui/widgets/grid/coal_plant_state.dart';
import 'package:dashboard/ui/widgets/grid/gauge_panel.dart';
import 'package:flutter/material.dart';

class ManagerGridDesktop extends StatelessWidget {
  final GridData gridData;

  ManagerGridDesktop({@required this.gridData});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                GaugePanel(gridData: gridData),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CoalPlantStateDisplay(
                                coalPlantState: gridData.coalPlantState,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlackoutList(blackouts: []),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElectricityChart(
                                  lastValue: gridData.bufferLoad,
                                  title: 'Buffer load (kWh)',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElectricityChart(
                                  lastValue: gridData.totalDemand,
                                  title: 'Grid demand (kW)',
                                  useGreen: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            Container(
              width: sizingInformation.screenSize.width * 0.20,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CoalPlantRatioChart(
                      ratio: gridData.ratio,
                      isCharging:
                          gridData.coalPlantState == CoalPlantState.RUNNING,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BatteryChart(bufferLoad: gridData.bufferLoad),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
