import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
             decoration: new InputDecoration(
               labelText: "Tes Input",
               hintText: "Teks yang akan di input",
             ),
           ),
            Padding(
                padding: EdgeInsets.all(16.0)
            ),
            TextField(
              decoration: new InputDecoration(
                labelText: "Tes Input 2",
                hintText: "Teks yang akan di input",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),
           ElevatedButton(
               onPressed: () {
                 // Tindakan yang akan dijalankan saat tombol ditekan
               },
               style: ElevatedButton.styleFrom(
                 primary: Colors.blue),
               child: Text(
             "Simpan",
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