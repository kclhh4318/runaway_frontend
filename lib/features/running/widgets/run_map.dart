import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RunMap extends StatelessWidget {
  final List<LatLng> routePoints;

  const RunMap({Key? key, required this.routePoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: routePoints.isNotEmpty ? routePoints.last : LatLng(0, 0),
        zoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: routePoints,
              strokeWidth: 4.0,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}