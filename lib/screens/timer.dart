import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async package for using Timer

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExerciseScreen(),
    );
  }
}

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int exerciseDuration = 5; // Initial exercise duration in seconds
  bool isTimerRunning = false;
  bool showStartButton = true;
  bool showRestartButton = false;
  bool allowNextStep = false;
  int currentTime = 0;
  late Timer _timer; // Define the Timer object

  void startTimer() {
    setState(() {
      isTimerRunning = true;
      showStartButton = false;
      showRestartButton = true;
      allowNextStep = false;
      currentTime = exerciseDuration;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (currentTime > 0) {
          currentTime -= 1;
        } else {
          allowNextStep = true;
          isTimerRunning = false;
          print("timer");
          print(isTimerRunning);
          timer.cancel();
        }
      });
    });
  }

  void restartTimer() {
    setState(() {
      isTimerRunning = false;
      showStartButton = true;
      showRestartButton = false;
      allowNextStep = false;
      currentTime = 0;
    });
    _timer.cancel(); // Cancel the running timer when restarting
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Exercise Duration: $exerciseDuration seconds',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Timer: $currentTime seconds',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            if (showStartButton)
              ElevatedButton(
                onPressed: startTimer,
                child: Text('Start Exercise'),
              ),
            if (showRestartButton)
              ElevatedButton(
                onPressed: restartTimer,
                child: Text('Restart Exercise'),
              ),
            SizedBox(height: 20),
            if (isTimerRunning)
              Text(
                'Timer is Running...',
                style: TextStyle(fontSize: 20),
              ),
            if (allowNextStep)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allowNextStep = false;
                    // Add logic to move to the next step/exercise
                  });
                },
                child: Text('Next Step'),
              ),
          ],
        ),
      ),
    );
  }
}
