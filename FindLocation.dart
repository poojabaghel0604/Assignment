import 'dart:async';
import 'package:flutter/material.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // on below line we have given title of app
        title: Text("find current location"),
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());

            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );

            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}
//
// class LocationFetcher extends StatefulWidget {
//   @override
//   _LocationFetcherState createState() => _LocationFetcherState();
// }
//
// class _LocationFetcherState extends State<LocationFetcher> {
//   String _locationMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     initLocationFetcher();
//     initBackgroundFetch();
//   }
//
//   // Function to fetch the current location
//   Future<void> fetchCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         //desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         _locationMessage =
//         'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
//       });
//     } catch (e) {
//       setState(() {
//         _locationMessage = 'Failed to get location: $e';
//       });
//     }
//   }
//
//   // Initialize background fetch for periodic location updates
//   void initBackgroundFetch() {
//     BackgroundFetch.configure(
//       BackgroundFetchConfig(
//         minimumFetchInterval: 60 * 60, // Minimum interval in seconds (1 hour)
//         stopOnTerminate: false,
//         enableHeadless: true,
//         startOnBoot: true,
//       ),
//       backgroundFetchHeadlessTask,
//     );
//   }
//
//   // Background task to fetch location periodically
//   void backgroundFetchHeadlessTask() async {
//     await fetchCurrentLocation();
//     BackgroundFetch.finish;
//   }
//
//   // Initialize location fetcher and fetch the current location
//   void initLocationFetcher() async {
//     await fetchCurrentLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Fetcher'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Current Location:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _locationMessage,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }