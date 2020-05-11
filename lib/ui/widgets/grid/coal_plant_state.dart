import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';
import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:flutter/material.dart';

class CoalPlantStateDisplay extends StatefulWidget {
  final CoalPlantState coalPlantState;

  CoalPlantStateDisplay({@required this.coalPlantState});

  @override
  _CoalPlantStateDisplayState createState() => _CoalPlantStateDisplayState();
}

class _CoalPlantStateDisplayState extends State<CoalPlantStateDisplay> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          ChartTitle(title: 'Coal plant'),
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: (widget.coalPlantState == CoalPlantState.RUNNING ||
                              widget.coalPlantState == CoalPlantState.STARTING)
                          ? Color.fromRGBO(5, 247, 150, 0.2)
                          : Colors.pink.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Icon(
                            (widget.coalPlantState == CoalPlantState.RUNNING ||
                                    widget.coalPlantState ==
                                        CoalPlantState.STARTING)
                                ? Icons.offline_bolt
                                : Icons.power_settings_new,
                            color: (widget.coalPlantState ==
                                        CoalPlantState.RUNNING ||
                                    widget.coalPlantState ==
                                        CoalPlantState.STARTING)
                                ? Color.fromRGBO(5, 247, 150, 1)
                                : Colors.pink,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 27.0, vertical: 15.0),
                          child: Text(
                            widget.coalPlantState.toString().split('.').last,
                            style: TextStyle(
                                color: (widget.coalPlantState ==
                                            CoalPlantState.RUNNING ||
                                        widget.coalPlantState ==
                                            CoalPlantState.STARTING)
                                    ? Color.fromRGBO(5, 247, 150, 1)
                                    : Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 70,
                color: Colors.grey.withOpacity(0.4),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 25),
                child: _isLoading
                    ? Container(
                      width: 150,
                        child: Center(
                          child: GreenLeanProgressIndicator(size: 40),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            icon: Icon(Icons.offline_bolt),
                            label: Text(
                              'POWER ON ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            color: Color.fromRGBO(5, 247, 150, 0.6),
                            hoverColor: Color.fromRGBO(5, 247, 150, 0.7),
                            onPressed: () {
                              setState(() => _isLoading = true);
                              ApiService api = locator<ApiService>();
                              api
                                  .setCoalPlantState(CoalPlantState.RUNNING)
                                  .then((_) =>
                                      setState(() => _isLoading = false));
                            },
                          ),
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            icon: Icon(Icons.power_settings_new),
                            label: Text(
                              'POWER OFF',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            color: Colors.pink.withOpacity(0.7),
                            hoverColor: Colors.pink.withOpacity(0.8),
                            onPressed: () {
                              setState(() => _isLoading = true);
                              ApiService api = locator<ApiService>();
                              api
                                  .setCoalPlantState(CoalPlantState.STOPPED)
                                  .then((_) =>
                                      setState(() => _isLoading = false));
                            },
                          ),
                        ],
                      ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
