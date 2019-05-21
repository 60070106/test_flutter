import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1st Screen')),
      body: Center(
        child: FlatButton(
          child: Text("LEM ME TRY HARD"),
          onPressed: () {
            Navigator.pushNamed(context, "/second");
          },
        ),
      ),
    );
  }
}
