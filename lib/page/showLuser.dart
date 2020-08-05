import 'package:flutter/material.dart';

class ShowLuserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (arg != null)
                ? Text(arg,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold))
                : Text("!!! Please login again"),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home-page', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
