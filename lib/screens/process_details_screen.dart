import 'package:flutter/material.dart';
import 'package:aravision/screens/congrats.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> exercise;

  ExerciseDetailsScreen({required this.exercise});

  @override
  _ExerciseDetailsScreenState createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late FlutterTts _flutterTts;
  bool _isTimerCompleted = true;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _flutterTts = FlutterTts();
    _speakInstructions();
  }

  Future<void> _speakInstructions() async {
    String textToSpeak = widget.exercise['steps'][_currentPage]['audio text'];
    print(textToSpeak);
    await _flutterTts.setLanguage("en-us");
    await _flutterTts.setPitch(1);
    await _flutterTts.speak(textToSpeak);
  }

  Future<void> _stopInstructions() async {
    await _flutterTts.stop();
  }

  Widget WrongPopup() {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16.0), // Adjust the padding as needed
      content: Container(
        height: 200, // Set the desired height
        child: Column(
          children: [
            const Text(
              "If you are not able to see the rope as double, slowly blink your eyes a few times and refocus",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
                height: 10.0), // Add vertical spacing between text and image
            Image.asset(
              "assets/img/brock_string/blinking.gif",
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget QuestionCard(Map<String, dynamic> step, int stepIndex) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question: ${step['question']['question']}'),
            SizedBox(
                height:
                    16.0), // Add vertical spacing between question and options
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Adjust as needed
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    step['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (step['question']['correct option number'] == 1) {
                      _moveToNextStep(stepIndex);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return WrongPopup();
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('${step['question']['options'][0]}'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (step['question']['correct option number'] == 2) {
                      _moveToNextStep(stepIndex);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return WrongPopup();
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('${step['question']['options'][1]}'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _moveToNextStep(int currentStepIndex) {
    if (currentStepIndex < widget.exercise['steps'].length - 1) {
      _pageController.animateToPage(
        currentStepIndex + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CongratsScreen(),
        ),
      );
    }
  }

  Widget StepDetailsCard(Map<String, dynamic> step) {
    int duration = step['Timer'];
    if (duration != 0) {
      _isTimerCompleted = true;
    }
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '${step['Description']}',
                style:
                    TextStyle(fontSize: 16.0), // Adjust the font size as needed
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                step['image'],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 500,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                    _speakInstructions();
                  },
                  children: [
                    for (int i = 0; i < widget.exercise['steps'].length; i++)
                      if (widget.exercise['steps'][i]['type'] == 'question')
                        QuestionCard(widget.exercise['steps'][i], i)
                      else
                        StepDetailsCard(widget.exercise['steps'][i]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Step ${_currentPage + 1}'),
                    ElevatedButton(
                      onPressed: _isTimerCompleted &&
                              !(widget.exercise['steps'][_currentPage]
                                      ['type'] ==
                                  'question')
                          ? _currentPage == widget.exercise['No of steps'] - 1
                              ? () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CongratsScreen();
                                  }));
                                }
                              : () {
                                  if (_currentPage <
                                      widget.exercise['No of steps'] - 1) {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                }
                          : null,
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.exercise['No of steps'] - 1
                                ? 'Finish'
                                : 'Next',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _stopInstructions();
    _pageController.dispose();
    super.dispose();
  }
}
