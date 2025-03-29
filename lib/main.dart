import 'package:flutter/material.dart';
import 'package:games_x_o/Homepage.dart';
import 'package:games_x_o/introduction_Page.dart.dart';

void main() {
  runApp(App());
}
class App extends StatelessWidget {
const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: introduction(),
    );
  }
}
