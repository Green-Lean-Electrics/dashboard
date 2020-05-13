import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:dashboard/ui/widgets/grid/blackout_tile.dart';
import 'package:flutter/material.dart';

class BlackoutList extends StatelessWidget {
  final List<User> blackouts;

  BlackoutList({@required this.blackouts});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ChartTitle(
              title: 'Blackouts',
            ),
            Expanded(
              child: blackouts.length == 0
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.power, size: 100),
                          Container(
                            width: 0,
                            height: 35,
                          ),
                          Text(
                            'No household is affected by\na blackout right now',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: blackouts.length,
                      itemBuilder: (context, index) => BlackoutTile(
                        user: blackouts[index],
                      ),
                      separatorBuilder: (_, __) => Row(
                        children: <Widget>[
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
