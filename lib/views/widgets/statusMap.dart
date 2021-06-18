import 'dart:collection';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:ridershub/views/colors.dart';

class StatusMap extends StatefulWidget {
  const StatusMap({Key key}) : super(key: key);
  // final LocationData location;

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
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  List<LatLng> _testPolygonLatLong = [
    LatLng(38.60740431023561, -121.22725099325179),
    LatLng(38.57997494032564, -121.93718008697033),
    LatLng(37.85620581208043, -122.14752931147814),
    LatLng(36.985222969658835, -121.85829900205135),
    LatLng(36.77468304898726, -121.35871980339289),
  ];
  Set<Polygon> _testPolygon = HashSet<Polygon>();

  Set<Polygon> _polygons = HashSet<Polygon>();
  LocationData _locationData;

  _initTestPolygon() {
    final String _polygonIdVal = 'polygon_id_40';
    _testPolygon.add(Polygon(
        polygonId: PolygonId(_polygonIdVal),
        points: _testPolygonLatLong,
        strokeWidth: 1,
        strokeColor: APP_PRIMARY,
        fillColor: darken(APP_PRIMARY, 0.2).withOpacity(0.4)));
  }

  _setPolygon() {
    final String _polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(_polygonIdVal),
        points: _polygonLatLongs,
        strokeWidth: 1,
        strokeColor: APP_PRIMARY,
        fillColor: darken(APP_PRIMARY, 0.2).withOpacity(0.4)));
  }

  @override
  void initState() {
    super.initState();
    _initTestPolygon();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/ordershotspot.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
    // _locationData = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      polygons: _testPolygon,
      myLocationEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (point) {
        print("${point.toString()}");
        setState(() {
          _polygonLatLongs.add(point);
          _setPolygon();
        });
      },
    );
  }
}
