import 'package:flutter/material.dart';
import 'package:projeckflutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({super.key, required this.title});



  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           TextFormField(
             decoration: const InputDecoration(
               labelText: "Tes Input",
               hintText: "Teks yang akan di input",
             ),
           ),
            const Padding(
                padding: EdgeInsets.all(16.0)
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Tes Input 2",
                hintText: "Teks yang akan di input",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
            ),
           ElevatedButton(
               onPressed: () {
                 // Tindakan yang akan dijalankan saat tombol ditekan
               },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue),
               child: const Text(
             "Simpan",
             style: TextStyle(
               color:  Colors.white
             ),
           )
           ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder:(context) => const MyHomePage(title: "Hello Push")),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue),
                child: const Text(
                  "logout",
                  style: TextStyle(
                      color:  Colors.white
                  ),
                )
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}