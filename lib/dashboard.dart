import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeckflutter/DeleteData.dart';
import 'package:projeckflutter/SendDataFetch.dart';
import 'package:projeckflutter/TutorFetch.dart';
import 'package:projeckflutter/dosen/dashboarddosen.dart';
import 'package:projeckflutter/mahasiswa/dashboardmhs.dart';
import 'package:projeckflutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  _DashboardState createState() => _DashboardState();

}
class _DashboardState extends State<Dashboard>{
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
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
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              leading:  Icon(Icons.person_pin),
              subtitle: Text("Menu CRUD Data Dosen"),
            onTap: (){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> DashboardDosen(title: "DashBoard Dosen"))
               );
            },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              leading:  Icon(Icons.person_pin),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> DashboardMhs(title: "DashBoard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              leading:  Icon(Icons.library_books_outlined),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fetch Data'),  // Perubahan di sini
              trailing: Icon(Icons.school_sharp),
              subtitle: Text('tutor fetch cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TutorFetch(),
                  ),
                );  // Perubahan di sini
              },
            ),

            ListTile(
              title: const Text('Send Data'),  // Perubahan di sini
              trailing: Icon(Icons.school_sharp),
              subtitle: Text('tutor send cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendData(),
                  ),
                );  // Perubahan di sini
              },
            ),
            ListTile(
              title: const Text('Delete data'),  // Perubahan di sini
              trailing: Icon(Icons.delete_outline),
              subtitle: Text('tutor delete cata'),  // Perubahan di sini
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteData(),
                  ),
                );  // Perubahan di sini
              },
            ),
          ListTile(
            title: Text("Data Jadwal"),
            trailing: Icon(Icons.schedule_outlined),
            leading:  Icon(Icons.timelapse_rounded),
            subtitle: Text("Menu CRUD Data Jadwal"),
            onTap: (){
              Navigator.pop(context);
            },
          ),

            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt(("is_login"), 0);
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                );
              },
            )
          ]
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        )
      ),
    );
  }


}
