import 'package:cowin_app/home.dart';
import 'package:cowin_app/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: 'home', routes: {
    'home': (context) => MyHome(),
    'Result': (context) => Results()
  }));
}
