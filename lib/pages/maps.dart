import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);

  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class DefaultState {
  static List<Marker> markers = [
    const Marker(
        markerId: MarkerId("Telyu"),
        position: LatLng(-6.973316494962252, 107.63035165554288)),
    const Marker(
        markerId: MarkerId("FIF"),
        position: LatLng(-6.97585234417395, 107.63064727001229)),
  ];
  // static List<Polygon> polygons = [
  //   Polygon(
  //     polygonId: const PolygonId("FIF"),
  //     points: const [
  //       LatLng(-6.975575564736307, 107.63055772782457),
  //       LatLng(-6.97600216871913, 107.63055376666827),
  //       LatLng(-6.9760041346352075, 107.6307597467959),
  //       LatLng(-6.975581462489882, 107.6307637079522),
  //     ],
  //     strokeWidth: 1,
  //     strokeColor: Colors.lightBlue,
  //     fillColor: Colors.lightBlue,
  //   )
  // ];
}

class _SimpleMapState extends State<SimpleMap> {
  List<Marker> _markers = [];
  List<Polygon> _polygons = [];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers = DefaultState.markers;
      // _polygons = DefaultState.polygons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.973316494962252, 107.63035165554288),
          zoom: 20,
        ),
        markers: _markers.toSet(),
        // polygons: _polygons.toSet(),
      ),
    );
  }
}
