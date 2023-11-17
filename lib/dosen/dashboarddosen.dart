import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget {
  final String title;

  DashboardDosen({required this.title});

  @override
  DashboarDosenState createState() => DashboarDosenState();
}
 

class DashboarDosenState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>(); // Fix: FormState, not formState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
          child:GestureDetector(
            // onLongPress: (){
            //   showDialog(context: context,
            //       builder: (BuildContext context){
            //         return AlertDialog(
            //           title: Text(""),
            //           content: Column(
            //             children: <Widget>[
            //               ElevatedButton(
            //                 child: Text('Edit'),
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                   // Lakukan sesuatu ketika tombol ditekan
            //                 },
            //
            //               ),
            //               ElevatedButton(
            //                 child: Text('Delete'),
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                   // Lakukan sesuatu ketika tombol ditekan
            //                 },
            //
            //               ),
            //             ],
            //           ),
            //         );
            //       });
            // },

              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Argo Uchiha"),
                      subtitle: Text("0822141112 - Argo@Staff.ukdw.ac.id"),
                      trailing: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            child: const Text("Update"),
                            value: 'Doge',
                          ),
                          PopupMenuItem<String>(
                            child: const Text("Delete"),
                            value: 'Lion',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }
}