import 'package:dashboard/ui/widgets/charts/chart_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class StaticMap extends StatelessWidget {
  final LatLng location;

  StaticMap({@required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ChartTitle(
              title: 'Your household\'s location',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: FlutterMap(
                    options: MapOptions(
                      center: location,
                      zoom: 12.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/pitazzo/ck8qcai9u03mq1io20upsn6ty/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}',
                          additionalOptions: {
                            'access_token':
                                'pk.eyJ1IjoicGl0YXp6byIsImEiOiJjanQ0YW82dGcxNHo5NDVxdTNhMGRmdW5qIn0.3PUsd4pngYnc3SfUiHe8-Q',
                            'id': ''
                          },
                          tileProvider: NonCachingNetworkTileProvider()),
                      MarkerLayerOptions(markers: [
                        Marker(
                          width: 60.0,
                          height: 60.0,
                          point: location,
                          builder: (ctx) => new Container(
                            child: Icon(
                              Icons.location_on,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
