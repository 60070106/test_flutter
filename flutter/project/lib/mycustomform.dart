import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Text("One"),
//         Text("Two"),
//         Text("Three"),
//       ],
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker'),
      ),
      body: new Center(
        child: _image == null
        ? new Text('No image selected.')
        : new Image.file(_image),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: new Icon(Icons.add_a_photo),
        ),
    );
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  int _radioValue1 = -1;
  bool checkboxValue1 = false;
  List<String> _passengers = <String>[
    '',
    'What',
    'The',
    'Fuxk',
    'is',
    'this shit'
  ];
  var _passenger = "";

  DateTime date;
  var dateFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.text_fields),
                  labelText: 'Text',
                  hintText: 'Enter some text'),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: (value) {
                    setState(() {
                      _radioValue1 = value;
                    });
                  },
                ),
                Text("Yup"),
                Radio(
                  value: 1,
                  groupValue: _radioValue1,
                  onChanged: (value) {
                    setState(() {
                      _radioValue1 = value;
                    });
                  },
                ),
                Text("NO"),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: checkboxValue1,
                  onChanged: (bool value) {
                    setState(() {
                      checkboxValue1 = value;
                    });
                  },
                ),
                Text("Checked"),
              ],
            ),
            InputDecorator(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                labelText: 'Passenger',
              ),
              isEmpty: _passenger == "",
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _passenger,
                  isDense: true,
                  onChanged: (String value) {
                    setState(() {
                      _passenger = value;
                    });
                  },
                  items: _passengers.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            DateTimePickerFormField(
              inputType: InputType.date,
              format: dateFormat,
              decoration: InputDecoration(labelText: 'Date'),
              onChanged: (dt) => setState(() => date = dt),         
            ),
            RaisedButton(
                onPressed: () {
                  _formKey.currentState.validate();
                },
                child: Text('Confirm'))
          ],
        ),
      ),
    );
  }
}
