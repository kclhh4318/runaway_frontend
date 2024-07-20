import 'package:flutter/material.dart';
import 'package:runaway/features/running/widgets/countdown_timer.dart';
import 'package:runaway/features/running/widgets/running_stats_display.dart';
import 'package:runaway/features/running/widgets/pause_stop_button.dart';

class RunningSessionScreen extends StatefulWidget {
  const RunningSessionScreen({Key? key}) : super(key: key);

  @override
  _RunningSessionScreenState createState() => _RunningSessionScreenState();
}

class _RunningSessionScreenState extends State<RunningSessionScreen> {
  bool _isRunning = false;
  bool _showCountdown = true;

  void _startRunning() {
    setState(() {
      _showCountdown = false;
      _isRunning = true;
    });
  }

  void _pauseRunning() {
    setState(() {
      _isRunning = false;
    });
  }

  void _stopRunning() {
    // TODO: Implement stop running logic and navigation to results screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _showCountdown
            ? CountdownTimer(onFinished: _startRunning)
            : Column(
          children: [
            RunningStatsDisplay(isRunning: _isRunning),
            Expanded(child: Container()), // Placeholder for map or other content
            PauseStopButton(
              isRunning: _isRunning,
              onPause: _pauseRunning,
              onResume: _startRunning,
              onStop: _stopRunning,
            ),
          ],
        ),
      ),
    );
  }
}