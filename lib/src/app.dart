import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Techzombie',
      home: HomeScreen(),
    );
  }
}
