import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2nd Screen')),
      body: Center(
        child: FlatButton(
          child: Text("FUCKED"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}