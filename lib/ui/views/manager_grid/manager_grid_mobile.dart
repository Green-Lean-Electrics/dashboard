import 'package:dashboard/core/models/grid_data.dart';
import 'package:dashboard/ui/widgets/grid/gauge_panel.dart';
import 'package:flutter/material.dart';

class ManagerGridMobile extends StatelessWidget {
  final GridData gridData;

  ManagerGridMobile({@required this.gridData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          GaugePanel(gridData: gridData)
        ]
      ),
    );
  }
}
