import 'dart:collection';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'views/colors.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    ));

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  List<LatLng> _testPolygonLatLong = [
    LatLng(38.60740431023561, -121.22725099325179),
    LatLng(38.57997494032564, -121.93718008697033),
    LatLng(37.85620581208043, -122.14752931147814),
    LatLng(37.9797536, -122.9017334),
    LatLng(36.985222969658835, -121.85829900205135),
    LatLng(36.77468304898726, -121.35871980339289),
  ];
  Set<Polygon> _testPolygon = HashSet<Polygon>();

  _initTestPolygon() {
    final String _polygonIdVal = 'polygon_id_40';
    _testPolygon.add(Polygon(
        polygonId: PolygonId(_polygonIdVal),
        points: _testPolygonLatLong,
        strokeWidth: 1,
        strokeColor: APP_PRIMARY,
        fillColor: darken(APP_PRIMARY, 0.2).withOpacity(0.4)));
  }

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    _initTestPolygon();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/ordershotspot.png');
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(37.3797536, -122.1017334);

    // these are the minimum required values to set
    // the camera position
    CameraPosition initialLocation = CameraPosition(
        zoom: 7,
        // bearing: 30,
        target: pinPosition);

    return GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        markers: _markers,
        mapType: MapType.normal,
        polygons: _testPolygon,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          // controller.setMapStyle(Utils.mapStyles);
          _controller.complete(controller);
          setState(() {
            _markers.add(Marker(
                markerId: MarkerId('<MARKER_ID>'),
                position: pinPosition,
                icon: pinLocationIcon));
          });
        });
  }
}

// class Utils {
//   static String mapStyles = '''[
//   {
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative.land_parcel",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#bdbdbd"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "road",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#dadada"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.line",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.station",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#c9c9c9"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   }
// ]''';
// }
