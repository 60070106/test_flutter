import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String firstName = 'Supawach';
  String lastName = 'Klinkajohn';

  String address = '''


  ''';

  int age = 20;
  double weight = 60.0;
  double height = 160.0;

  bool isActive = true;
  bool isCancel = false;

  var description = 'sssss';

  Map types = {'type': 'Admin', 'code': 'ADM'};
  Map<String, int> types2 = {'age':20};

  List sex = ['male', 'female'];
  List<int> ages = [20, 30, 40];
  List<Map<String, int>> myusers = [{'weight': 60, 'age': 20}];

  void showName(String name, int age){
    print('Name: $name, Age: $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Application"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              print('$firstName $lastName');
              print('---------------------');
              double bmi = weight / ((height / 100) * (height / 100));
              print('BMI:$bmi');

              showName('NungMeak', 15);

              Person person = Person('Hello Fluter!!');
              person.showName();
            },
            color: Colors.pink,
            textColor: Colors.white,
            child: Text("Try me"),
          ),
        ));
  }
}

class Person {
  String name;

  Person(this.name);

  showName() {
    print('Classs, name: $name');
  }

}
