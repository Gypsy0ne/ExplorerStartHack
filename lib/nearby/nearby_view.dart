import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NearbyScreenState();
}

class NearbyScreenState extends State<NearbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MapSample(),
      bottomSheet: _nearbyBottomSheet(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _nearbyBottomSheet() {
    return BottomSheet(
      onClosing: () {},
      elevation: 8,
      builder: (context) {
        return Container(
            height: 100,
            color: Color.fromARGB(100, 232, 112, 54),
            alignment: Alignment.center,
            child: Text("No Events Nearby"));
      },
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

}

