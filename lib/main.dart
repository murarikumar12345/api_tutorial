// import 'package:api_tutorial_class/home_screen.dart';//
import 'package:api_tutorial_class/example_four.dart';
import 'package:api_tutorial_class/examplethree.dart';
import 'package:flutter/material.dart';
import 'package:api_tutorial_class/example_two_api.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: SecondExample(),
      home: ExampleFour(),
    );
  }
}
