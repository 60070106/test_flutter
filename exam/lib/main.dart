import 'package:exam/ui/add_screen.dart';
import 'package:exam/ui/datepicker.dart';
import 'package:exam/ui/login_screen.dart';
import 'package:exam/ui/page_one.dart';
import 'package:exam/ui/todo.dart';
import 'package:exam/ui/users_screen.dart';
import 'package:flutter/material.dart';
import 'ui/main_screen.dart';
import 'ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     fontFamily: 'PrintAble4U',
      //     scaffoldBackgroundColor: Colors.white70,
      //     primaryColor: Colors.blue,
      //     accentColor: Colors.amber),
      // title: "My App",
      title: 'DateDicker',
      theme: ThemeData.light().copyWith(
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
      home: TodoScreen(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddScreen('Kuy'),
        '/photo': (BuildContext context) => PageOne(),
        '/users': (BuildContext context) => UserScreen()
      },
    );
  }
}


// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Final is Cuming',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: "/",
//       routes: {
//         "/": (context) => MyHomePage(),
//         "/second": (context) => SecondScreen(),
//       },
//     );
//   }
// }
