import 'dart:io';

import 'package:exam/ui/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam/ui/page_one.dart';
import 'package:exam/ui/page_two.dart';
import 'package:exam/ui/page_three.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List pages = [PageOne(), PageTwo(), PageThree()];

  bool hasImage = true;

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text(
        'โฮม',
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/photo')),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.of(context).pushNamed('/add')),
      ],
    );

    Widget floatingAction = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        var response = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddScreen('Hell')));
        
        if (response != null) {
          print(response['name'] ?? '-');
        }
      },
    );

    Widget bottomNavBar = BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("หน้าหลัก")),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("บัญชี")),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text("ตั้งค่า"))
      ],
    );

    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: hasImage
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/women/28.jpg'),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Text(
                      'AB',
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
            accountName: Text(
              'Supawach Klinkajohn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25, 
                fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'Nungmeak@it.com',
              style: TextStyle(
                color: Colors.white
              ),),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/pic1.jpg')
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            subtitle: Text('หน้าเมนูหลักใช้งาน'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('หน้าหลัก'),
            subtitle: Text('ข้อมูลผู้ใช้'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('หน้าหลัก'),
            subtitle: Text('ตั้งค่าการใช้งาน'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/add');
            },
          ),
          Divider(),
           ListTile(
            title: Text('ออกจากแอพพลิเคชั่น'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: pages[currentIndex],
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
