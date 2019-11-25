import 'package:flutter/material.dart';
import 'package:hiking_front/homepage.dart';
import 'package:hiking_front/accountpage.dart';
import 'package:hiking_front/mt_searchpage.dart';
import 'package:hiking_front/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

