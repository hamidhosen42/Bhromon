// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, unused_element, avoid_print, prefer_interpolation_to_compose_strings, unused_local_variable, non_constant_identifier_names, use_key_in_widget_constructors

import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation extends StatefulWidget {
  final double latitude_address;
  final double longitude_address;
  final String location;

  const PlaceLocation({required this.latitude_address, required this.longitude_address,required this.location});

  @override
  State<PlaceLocation> createState() => _PlaceLocationState();
}

class _PlaceLocationState extends State<PlaceLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _kGooglePlex;
  List<Marker> _markers = [];

  Future<Position> placeLocation() async {
    await Geolocator.requestPermission().catchError((error) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  loadData() {
    placeLocation().then((value) async {
      // print("My current location");
      // print(value.latitude.toString() + "  " + value.longitude.toString());

      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(widget.latitude_address, widget.longitude_address),
          zoom: 15,
        );

        _markers = [
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(widget.latitude_address, widget.longitude_address),
            infoWindow: InfoWindow(title: widget.location),
          ),
        ];
      });

      final GoogleMapController controller = await _controller.future;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map",style: TextStyle(fontSize: 30.sp),),
        elevation: 0,
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex ?? CameraPosition(
          target: LatLng(widget.latitude_address, widget.longitude_address),
          zoom: 15,
        ),
          markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        trafficEnabled: true,
        rotateGesturesEnabled: true,
        buildingsEnabled: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: FloatingActionButton(
          onPressed: () {
            loadData();
          },
          child: Icon(Icons.local_activity),
        ),
      ),
    );
  }
}
