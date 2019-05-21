import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var users;
  bool isLoading = true;

  Future<Null> getUsers() async {
    final response = await http.get('https://randomuser.me/api/?results=20');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);

      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });
    } else {
      print("Error Connection");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users list'),
      ),
      body: RefreshIndicator(
        onRefresh: getUsers,
        child: isLoading
            ? Center( child: CircularProgressIndicator())
            : ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return Column(children: <Widget>[
                    ListTile(
                      onTap: () {},
                      title: Text(
                        '${users[index]['name']['first']} ${users[index]['name']['last']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('${users[index]['email']}'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    Divider()
                  ]);
                },
                itemCount: users != null ? users.length : 0,
              ),
      ),
    );
  }
}
