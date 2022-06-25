import 'package:flutter/material.dart';
import 'package:login_page/Pages/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LoginPage()),
    );
  }
}
