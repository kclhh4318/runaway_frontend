import 'package:flutter/material.dart';

class RunResultScreen extends StatelessWidget {
  const RunResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Run Result')),
      body: const Center(child: Text('Run Result Screen')),
    );
  }
}