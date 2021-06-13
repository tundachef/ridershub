import 'dart:collection';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:ridershub/views/colors.dart';

class StatusMap extends StatefulWidget {
  const StatusMap(this.location, {Key key}) : super(key: key);
  final LocationData location;

  @override
  _StatusMapState createState() => _StatusMapState();
}

class _StatusMapState extends State<StatusMap> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7,
  );
  int _polygonIdCounter = 1;
  List<LatLng> _polygonLatLongs = [];
  Set<Polygon> _polygons = HashSet<Polygon>();
  LocationData _locationData;

  _setPolygon() {
    final String _polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(_polygonIdVal),
        points: _polygonLatLongs,
        strokeWidth: 2,
        strokeColor: APP_PRIMARY,
        fillColor: APP_PRIMARY.withOpacity(0.5)));
  }

  @override
  void initState() {
    super.initState();
    _locationData = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      polygons: _polygons,
      myLocationEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (point) {
        setState(() {
          _polygonLatLongs.add(point);
          _setPolygon();
        });
      },
    );
  }
}
