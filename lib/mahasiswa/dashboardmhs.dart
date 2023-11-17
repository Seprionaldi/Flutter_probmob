import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMhs extends StatefulWidget {
  final String title;

  DashboardMhs({required this.title});

  @override
  DashboardMhsState createState() => DashboardMhsState();
}


class DashboardMhsState extends State<DashboardMhs> {
  final _formKey = GlobalKey<FormState>(); // Fix: FormState, not formState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Dashboard Mahasiswa",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}