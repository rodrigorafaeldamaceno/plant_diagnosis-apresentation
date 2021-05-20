import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final LatLng target;

  const MapSample({Key key, @required this.target}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  // final _target = LatLng(-25.364099, -54.241467);

  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType;
  Position _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    _currentMapType = MapType.hybrid;

    _getCurrentLocation().then((value) {
      _createPolylines(
        start: _currentPosition,
        destination: Position(
          latitude: widget.target.latitude,
          longitude: widget.target.longitude,
        ),
      );
    });
    _onAddMarkerButtonPressed();
  }

  // Method for retrieving the current location
  Future _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
      });
    }).catchError((e) {
      print(e);
    });
  }

// Create the polylines for showing the route between two places

  _createPolylines(
      {@required Position start, @required Position destination}) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    try {
      // Generating the list of coordinates to be used for
      // drawing the polylines
      final otherKey = 'YOUR-API-KEY';

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        otherKey,
        PointLatLng(start?.latitude, start?.longitude),
        PointLatLng(destination?.latitude, destination?.longitude),
        travelMode: TravelMode.driving,
      );

      print(result.errorMessage);
      print(result.status);

      // Adding the coordinates to the list
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }

      // Defining an ID
      PolylineId id = PolylineId('poly');

      // Initializing Polyline
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 3,
      );

      // Adding the polyline to the map
      setState(() {
        polylines[id] = polyline;
      });
      print(polylines.values.length);
    } catch (e) {
      print(e);
    }
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId('teste'),
          position: widget.target,
          infoWindow: InfoWindow(
            title: 'Really cool place',
            snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            mapType: _currentMapType,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: widget.target,
              zoom: 14.4746,
            ),
            markers: _markers,
            polylines: Set<Polyline>.of(polylines.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + 20,
              right: 8,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _onMapTypeButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.map,
                  size: 36.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
