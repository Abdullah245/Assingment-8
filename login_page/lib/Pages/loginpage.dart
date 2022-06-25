import 'package:flutter/material.dart';
import 'package:login_page/Constant/textconst.dart';
import 'package:login_page/Pages/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  late SharedPreferences prefs;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  String email = 'abdul';
  String password = 'abc';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                TextConstants.title,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: passwordcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  save();

                  if (email == emailcontroller &&
                      password == passwordcontroller) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Home()),
                      ),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("username", emailcontroller.toString());
    prefs.setString("password", passwordcontroller.toString());
  }
}
