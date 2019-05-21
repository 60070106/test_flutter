import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDicker extends StatefulWidget {
  @override
  DateDickerState createState() => DateDickerState();
}

class DateDickerState extends State<DateDicker> {
  DateTime date;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Datepicker')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat('yyyy-MM-dd'),
              decoration: InputDecoration(
                  labelText: 'Date', hasFloatingPlaceholder: false),
                  onChanged: (dt) => setState(() => date = dt),
            ),
          ],
        ),
      ));
}

class Imagepicker extends StatefulWidget {
  @override
  _ImagepickerState createState() => new _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
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
