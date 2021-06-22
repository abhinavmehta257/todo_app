import 'package:flutter/material.dart';
import 'package:todo_app/Login.dart';
import 'package:todo_app/dashboard.dart';
import 'package:todo_app/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
      routes: {
        '/dashboard':(context)=>MyHomePage(),
        '/login':(context)=>Login(),
        '/signup':(context)=>SignupPage()
      },
  ));
}
