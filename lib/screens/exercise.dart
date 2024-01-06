import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class FitnessScreen extends StatefulWidget {
  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isTimerCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                  _isTimerCompleted = false; // Reset timer completion status
                });
              },
              children: [
                StepPage(
                    "Step 1: Warm-up", "Instructions for warm-up.", onTimerEnd),
                StepPage(
                    "Step 2: Cardio", "Instructions for cardio.", onTimerEnd),
                StepPage("Step 3: Strength Training",
                    "Instructions for strength training.", onTimerEnd),
                // Add more StepPage widgets for additional steps
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined),
                      SizedBox(width: 8),
                      Text('Previous', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                Text('Step ${_currentPage + 1}'),
                ElevatedButton(
                  onPressed: _isTimerCompleted
                      ? () {
                          if (_currentPage <
                              2 /* Set the total number of steps - 1 */) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              _isTimerCompleted =
                                  false; // Reset timer completion status
                            });
                          }
                        }
                      : null,
                  child: const Row(
                    children: [
                      Text('Next', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTimerEnd() {
    setState(() {
      _isTimerCompleted = true;
    });
  }
}

class StepPage extends StatefulWidget {
  final String title;
  final String instructions;
  final Function onTimerEnd;

  StepPage(this.title, this.instructions, this.onTimerEnd);

  @override
  _StepPageState createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  int _duration = 20; // Set the duration for each step in seconds
  late int _endTime;

  @override
  void initState() {
    super.initState();
    _endTime = DateTime.now().millisecondsSinceEpoch + _duration * 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            widget.instructions,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          CountdownTimer(
            endTime: _endTime,
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            onEnd: () {
              // Handle timer completion, e.g., navigate to the next step
              print('Timer ended');
              widget.onTimerEnd();
            },
          ),
        ],
      ),
    );
  }
}
