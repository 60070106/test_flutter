import 'package:exam/ui/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  void doLogin() {
    print(ctrlUsername.text);
    print(ctrlPassword.text);

    if (ctrlUsername.text == 'admin' && ctrlPassword.text == 'admin') {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        width: 150,
                        height: 150,
                        image: AssetImage('assets/images/logo.png')),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: ctrlUsername,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'PrintAble4U',
                                  color: Colors.black45),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'Email address',
                                  filled: true,
                                  fillColor: Colors.white70),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: ctrlPassword,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'PrintAble4U',
                                  color: Colors.black45),
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  labelText: 'Password',
                                  filled: true,
                                  fillColor: Colors.white70),
                            ),
                            SizedBox(height: 20),
                            Material(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(30.0)),
                              shadowColor: Colors.redAccent.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 290.0,
                                height: 55.0,
                                onPressed: () => doLogin(),
                                color: Colors.red,
                                child: Text(
                                  'ลงชื่อเข้าใช้งาน',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.3),
                                ),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
