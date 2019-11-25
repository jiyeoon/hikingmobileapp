import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
import 'package:google_maps_webservice/geocoding.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _markers = {};

  final LatLng _center = const LatLng(45.521563, -122.677433);

  
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for(final office in googleOffices.offices){
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          )
        );
        _markers[office.name] = marker;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전국 산 지도'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers.values.toSet(),
        initialCameraPosition: CameraPosition(
              target: LatLng(36.7354629, 127.3818031), zoom: 7),
      ),


    );
  }
  
  Widget _buildBody(){
    return Stack(
      children: <Widget>[
        
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

        ),
      ],
    );
  }
}
