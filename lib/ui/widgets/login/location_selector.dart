import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LocationSelector extends StatefulWidget {
  final Function(LatLng) onSelected;
  final selectedLocation;

  LocationSelector(
      {@required this.onSelected, @required this.selectedLocation});

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  MapController _controller;
  LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _controller = MapController();
    _selectedLocation = widget.selectedLocation ?? LatLng(65.621653, 22.119347);
  }

  @override
  void didUpdateWidget(LocationSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedLocation != widget.selectedLocation) {
      _selectedLocation = widget.selectedLocation;
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        'Select your household location',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: mediaQuery.size.width * 0.9,
        height: mediaQuery.size.width * 0.8,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FlutterMap(
                mapController: _controller,
                options: MapOptions(
                    center: _selectedLocation,
                    zoom: 12.0,
                    onTap: (position) {
                      _controller.move(
                          position, (_controller.zoom + 1.0).roundToDouble());
                      setState(() => _selectedLocation = position);
                    }),
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
                  MarkerLayerOptions(
                      markers: _selectedLocation != null
                          ? [
                              Marker(
                                width: 60.0,
                                height: 60.0,
                                point: _selectedLocation,
                                builder: (ctx) => new Container(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                              ),
                            ]
                          : null),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _controller.move(
                            _controller.center, _controller.zoom),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _controller.move(_controller.center,
                            (_controller.zoom - 1.0).roundToDouble()),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              "CONFIRM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              widget.onSelected(_selectedLocation);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

class NonCachingNetworkTileProvider extends TileProvider {
  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    return NetworkImage(getTileUrl(coords, options));
  }
}
