import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xFF000A12),
        secondaryHeaderColor: Color(0xFF263238),
        primaryColor: Color(0xFF0377FF),
        primaryColorLight: Color(0xFFA3E3FF),
        dialogBackgroundColor: Color(0xFF525252),
        scaffoldBackgroundColor: Color(0xFFABABAB),
      ),
      home: HomeView(),
    );
  }
}
