import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projeckflutter/DeleteData.dart';
import 'package:projeckflutter/SendDataFetch.dart';
import 'package:projeckflutter/TutorFetch.dart';
import 'package:projeckflutter/dosen/dashboarddosen.dart';
import 'package:projeckflutter/mahasiswa/dashboardmhs.dart';
import 'package:projeckflutter/main.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});


  final String title;

  @override
  _DashboardState createState() => _DashboardState();


}
class _DashboardState extends State<Dashboard>{
  final _formKey = GlobalKey<FormState>();

  final Location _location = Location();
  late StreamSubscription<LocationData> _locationSubscription;

  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamConsumer<double> _followCurrentLocationStreamController;

  //data for slidingup
  final String data1 = "DATA LOKASI 1";
  final String data2 = "DATA LOKASI 2";
  final String data3 = "DATA LOKASI 3";
  final String data4 = "DATA LOKASI 4";
  late String dataSlide;
  late double long;
  late double lat;


  List<Marker> allMarkers = [];

  @override
  void initState(){
    super.initState();
    _followOnLocationUpdate = FollowOnLocationUpdate.always;
    _followCurrentLocationStreamController = StreamController<double>();

    dataSlide = data1;
    lat = -7.814152804539516;
    long = 110.39514515931207;

    dataSlide = data2;
    lat = -7.776925950151403;
    long = 110.417587608133;

    dataSlide = data3;
    lat = -7.810447112334517;
    long =110.3317282395377;

    dataSlide = data4;
    lat = -7.772883015693774;
    long =110.35162041008356;

    _locationSubscription = _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        lat = currentLocation.latitude ?? 0.0;
        long = currentLocation.longitude ?? 0.0;
        // Tambahkan marker ke lokasi aktual pengguna
        allMarkers.add(
          Marker(
            point: LatLng(lat, long),
            height: 15,
            width: 15,
            child: IconButton(
              onPressed: () {
                setState(() {
                  dataSlide = data1;
                  lat = -7.814152804539516;
                  long = 110.39514515931207;
                });
              },
              icon: const Icon(Icons.pin_drop),
            ),
          ),
        );
      });
    });

    allMarkers.add(
      Marker(
          point: const LatLng(-7.814152804539516,110.39514515931207),
          height: 15,
          width: 15,
        child: IconButton(
          onPressed: (){
            setState(() {
              dataSlide = data1;
              lat = -7.814152804539516;
              long = 110.39514515931207;
            });
          },
          icon: const Icon(Icons.pin_drop),
        )
      )
    );

    allMarkers.add(
        Marker(
            point: const LatLng(-7.776925950151403,110.417587608133),
            height: 15,
            width: 15,
            child: IconButton(
              onPressed: (){
                setState(() {
                  dataSlide = data2;
                  lat = -7.776925950151403;
                  long = 110.417587608133;
                });
              },
              icon: const Icon(Icons.pin_drop),
            )
        )
    );

    allMarkers.add(
        Marker(
            point: const LatLng(-7.810447112334517, 110.3317282395377),
            height: 15,
            width: 15,
            child: IconButton(
              onPressed: (){
                setState(() {
                  dataSlide = data3;
                  lat = -7.810447112334517;
                  long =110.3317282395377;
                });
              },
              icon: const Icon(Icons.pin_drop),
            )
        )
    );

    allMarkers.add(
        Marker(
            point: const LatLng(-7.772883015693774, 110.35162041008356),
            height: 15,
            width: 15,
            child: IconButton(
              onPressed: (){
                setState(() {
                  dataSlide = data4;
                  lat = -7.772883015693774;
                  long =110.35162041008356;
                });
              },
              icon: const Icon(Icons.pin_drop),
            )
        )
    );




  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName: Text("Seprionaldi"),
                accountEmail: Text("Seprionaldi@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
              ListTile(
              title: const Text("Data Dosen"),
              trailing: const Icon(Icons.people),
              leading:  const Icon(Icons.person_pin),
              subtitle: const Text("Menu CRUD Data Dosen"),
            onTap: (){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const DashboardDosen(title: "DashBoard Dosen"))
               );
            },
            ),
            ListTile(
              title: const Text("Data Mahasiswa"),
              trailing: const Icon(Icons.people_outline),
              leading:  const Icon(Icons.person_pin),
              subtitle: const Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const DashboardMhs(title: "DashBoard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: const Text("Data Matakuliah"),
              trailing: const Icon(Icons.library_books),
              leading:  const Icon(Icons.library_books_outlined),
              subtitle: const Text("Menu CRUD Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fetch Data'),  // Perubahan di sini
              trailing: const Icon(Icons.school_sharp),
              subtitle: const Text('tutor fetch cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TutorFetch(),
                  ),
                );  // Perubahan di sini
              },
            ),

            ListTile(
              title: const Text('Send Data'),  // Perubahan di sini
              trailing: const Icon(Icons.school_sharp),
              subtitle: const Text('tutor send cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SendData(),
                  ),
                );  // Perubahan di sini
              },
            ),
            ListTile(
              title: const Text('Delete data'),  // Perubahan di sini
              trailing: const Icon(Icons.delete_outline),
              subtitle: const Text('tutor delete cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeleteData(),
                  ),
                );  // Perubahan di sini
              },
            ),
          ListTile(
            title: const Text("Data Jadwal"),
            trailing: const Icon(Icons.schedule_outlined),
            leading:  const Icon(Icons.timelapse_rounded),
            subtitle: const Text("Menu CRUD Data Jadwal"),
            onTap: (){
              Navigator.pop(context);
            },
          ),

            const Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: const Text("Logout"),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt(("is_login"), 0);
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "Halo Push",)),
                );
              },
            )
          ]
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              center: LatLng(-7.814152804539516, 110.39514515931207), // Pusat peta
              zoom: 10, // Tingkat zoom awal
              minZoom: 1, // Tingkat zoom minimum
              maxZoom: 18, // Tingkat zoom maksimum
              boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)), // Padding untuk batas peta
              interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
            ),

            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              CurrentLocationLayer(
                  followOnLocationUpdate: _followOnLocationUpdate,
              ),

              MarkerLayer(
                markers: allMarkers,
              ),
              SlidingUpPanel(
                backdropEnabled: true,
                panel: Column(
                  children: [
                    Text(dataSlide),
                    ElevatedButton(
                        onPressed: (){
                          MapsLauncher.launchCoordinates(lat, long);
                        },
                        child: const Text("Navigasi"))
                  ],
                ),
              ),
              // PolygonLayer(
              //   polygonCulling: false,
              //   polygons: [
              //     Polygon(
              //         points: [
              //           LatLng(36.95, -9.5),
              //           LatLng(42.25, -9.5),
              //           LatLng(42.25, -6.2),
              //           LatLng(36.95, -6.2),
              //         ],
              //         color: Colors.blue.withOpacity(0.5),
              //         borderStrokeWidth: 2,
              //         borderColor: Colors.blue,
              //         isFilled: true
              //     ),
              //   ],
              // ),
              // PolylineLayer(
              //   polylines: [
              //     Polyline(
              //       points: [
              //         LatLng(38.73, -9.14), // Lisbon, Portugal
              //         LatLng(51.50, -0.12), // London, United Kingdom
              //         LatLng(52.37, 4.90), // Amsterdam, Netherlands
              //       ],
              //       color: Colors.blue,
              //       strokeWidth: 2,
              //     ),
              //   ],
              // ),
              // CircleLayer(
              //   circles: [
              //     CircleMarker(
              //       point: LatLng(52.2677, 5.1689), // center of 't Gooi
              //       radius: 5000,
              //       useRadiusInMeter: true,
              //       color: Colors.red.withOpacity(0.3),
              //       borderColor: Colors.red.withOpacity(0.7),
              //       borderStrokeWidth: 2,
              //     )
              //   ],
              // ),

            ],

          ),
        ],
      ),
    );
  }



   Marker buildMarker(LatLng coordinates, String word){
     return Marker(
       point: coordinates,
       width: 100,
       height: 15,
       child: buildTextWidget(word, context),
     );
   }



  TextStyle getDefaultTextStyle() {
    return const TextStyle(
      fontSize: 12,
      backgroundColor: Colors.black,
      color: Colors.white,
    );
  }

  Container buildTextWidget(String word, BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
            word,
            textAlign: TextAlign.center,
            style: getDefaultTextStyle()
        )
    );
  }







}
