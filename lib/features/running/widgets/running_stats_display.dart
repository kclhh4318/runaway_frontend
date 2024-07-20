import 'package:flutter/material.dart';
import 'dart:async';

class RunningStatsDisplay extends StatefulWidget {
  final bool isRunning;

  const RunningStatsDisplay({Key? key, required this.isRunning}) : super(key: key);

  @override
  _RunningStatsDisplayState createState() => _RunningStatsDisplayState();
}

class _RunningStatsDisplayState extends State<RunningStatsDisplay> {
  int _seconds = 0;
  double _distance = 0.0;
  String _avgPace = "05:00";
  String _currentPace = "05:00";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (widget.isRunning) {
        setState(() {
          _seconds++;
          // TODO: Implement actual distance calculation
          _distance += 0.005; // Placeholder: adds 5 meters per second
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem("평균 페이스", _avgPace),
              _buildStatItem("현재 페이스", _currentPace),
            ],
          ),
          SizedBox(height: 20),
          Text(
            _formatTime(_seconds),
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            "${_distance.toStringAsFixed(2)} km",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white70)),
        Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}