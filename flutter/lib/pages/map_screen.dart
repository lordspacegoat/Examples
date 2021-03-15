import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {

  _launchURL() async {
  const url = "https://www.google.com/maps/dir//Junction+29+Truck+Stop+Ltd,+Hardwick+View+Rd,+Holmewood,+Chesterfield+S42+5SA/@53.1873894,-1.3531064,14.82z/data=!4m9!4m8!1m0!1m5!1m1!1s0x487990ed7cd9a279:0xbd2d530e1b431f3!2m2!1d-1.3497223!2d53.1878452!3e0"; 
  if (await canLaunch(url)) { 
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
Widget build(BuildContext context) {
    List<Marker> allMarkers = [];
  allMarkers.add(
    Marker(markerId: MarkerId('Junction29'), draggable: false, position: LatLng(53.1875171, 
       -1.3499948), infoWindow: InfoWindow(title: "Junction 29 TruckStop", snippet: "Get Directions"), onTap: _launchURL,
  ));
  return Scaffold(
    body:
   new GoogleMap(
     initialCameraPosition: CameraPosition(
       target: LatLng(53.1875171, 
       -1.3499948),
       zoom: 16,
       ),myLocationButtonEnabled: false,
       markers: Set.from(allMarkers),
      ),
         floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: FloatingActionButton.extended(
              icon: Icon(Icons.directions),
              label: Text('Get Directions'),
  onPressed: _launchURL,
              ),
          ), 
  );
}
}
