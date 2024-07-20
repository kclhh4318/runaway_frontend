import 'package:flutter/material.dart';
import 'package:runaway/features/home/screens/home_screen.dart';

class RunawayApp extends StatelessWidget {
  const RunawayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Runaway',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}