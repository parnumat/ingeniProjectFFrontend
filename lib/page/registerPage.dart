import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web01/models/ReqRegister.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var _userNameController = TextEditingController();
    var _passWordController = TextEditingController();
    var _conPassController = TextEditingController();
    var _firstNameController = TextEditingController();
    var _lastNameController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextField(
                  //obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  controller: _userNameController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: _passWordController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm password',
                  ),
                  controller: _conPassController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(
                  children: [
                    Container(
                      width: 140,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        controller: _firstNameController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 140,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last name',
                        ),
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () async {
                      var reqRegister = ReqRegister();
                      reqRegister.username = _userNameController.text;
                      reqRegister.password = _passWordController.text;
                      reqRegister.firstName = _firstNameController.text;
                      reqRegister.lastName = _lastNameController.text;
                      reqRegister.userLevel = "User";
                      String jsonReq = reqRegisterToJson(reqRegister);
                      var response = await http.post(
                          "http://localhost:5000/users/Register",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
