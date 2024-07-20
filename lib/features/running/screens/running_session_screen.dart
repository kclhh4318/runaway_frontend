import 'package:flutter/material.dart';

class RunningSessionScreen extends StatelessWidget {
  const RunningSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Running Session')),
      body: const Center(child: Text('Running Session Screen')),
    );
  }
}