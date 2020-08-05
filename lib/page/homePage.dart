import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web01/models/ReqLogin.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _userNameController = TextEditingController();
  var _passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  controller: _userNameController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: _passWordController,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  //color: Colors.green,
                  child: Text("Sign in"),
                  onPressed: () async {
                    var reqLogin = ReqLogin();
                    reqLogin.username = _userNameController.text;
                    reqLogin.password = _passWordController.text;
                    String jsonReq = reqLoginToJson(reqLogin);
                    print(jsonReq);
                    var response = await http.post(
                        "http://localhost:5000/users/Login",
                        body: jsonReq,
                        headers: {
                          HttpHeaders.contentTypeHeader: 'application/json'
                        });
                    print(response.statusCode);
                    print(response.body);
                    (response.statusCode == 200)
                        ? Navigator.pushNamed(context, '/level-page',
                            arguments: response.body)
                        : Container();
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                  //color: Colors.blue,
                  child: Text("Sign up"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register-page');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
