import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DetailLugaresPage extends StatefulWidget {

  var lugar;

  DetailLugaresPage(this.lugar);



  @override
  State<DetailLugaresPage> createState() => _DetailLugaresPageState(lugar);
}

class _DetailLugaresPageState extends State<DetailLugaresPage> {
  var lugar;

  _DetailLugaresPageState(this.lugar);

 Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = Set<Marker>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lugar['name']),),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(lugar['latitud'], lugar['longitud']),
          zoom: 15,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _showMarker();
        },
      ),

    );
  }
  void _showMarker() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(lugar['name']),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(lugar['latitud'], lugar['longitud']),
          infoWindow: InfoWindow(
            title:  lugar['name'],
            snippet: "Dirección: ${lugar['addres']}"
          ),

          ));
    });
  }
}

