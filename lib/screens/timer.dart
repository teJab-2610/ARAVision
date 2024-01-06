import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimer {
  late Duration _duration;
  bool _isOverOnce = false;
  bool _isRunning = false;
  late Timer _timer;

  CustomTimer({required Duration duration}) {
    _duration = duration;
  }

  Duration get duration => _duration;
  bool get isOverOnce => _isOverOnce;
  bool get isRunning => _isRunning;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer(_duration, () {
        _isOverOnce = true;
        stop();
      });
    }
  }

  bool CurrSec() {
    return _timer.isActive;
  }

  void stop() {
    if (_isRunning) {
      _isRunning = false;
      _timer.cancel();
    }
  }

  void reset() {
    stop();
    _isOverOnce = false;
  }
}

class TimerUI extends StatelessWidget {
  final CustomTimer timer;

  TimerUI({required this.timer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Timer: ${timer.duration.inSeconds} seconds',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: timer.isRunning
                  ? null
                  : () => {
                        print(timer.isRunning),
                        timer.start(),
                        print("timer started"),
                        print(timer.isRunning)
                      },
              child: Text('Start'),
            ),
            ElevatedButton(
              onPressed: timer.isRunning ? () => timer.stop() : null,
              child: Text('Stop'),
            ),
            ElevatedButton(
              onPressed: timer.reset,
              child: Text('Reset'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          'Tick: ${timer.CurrSec()}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
        Text(
          timer != null
              ? 'Tick: ${timer.CurrSec()}'
              : 'Tick: ${timer.CurrSec()}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
