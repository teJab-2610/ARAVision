import 'package:flutter/material.dart';
import 'package:aravision/screens/congrats.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class ExerciseDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> exercise;

  ExerciseDetailsScreen({required this.exercise});

  @override
  _ExerciseDetailsScreenState createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  List encourage = [
    "Hooray!",
    "You're doing great!",
    "Good Work",
    "Keep it up!",
    "Well Done",
    "Bravo!",
    "Great Work",
    "You're on fire",
    "Thumbs Up!",
    "Excellent",
    "Outstanding",
    "Fantastic",
    "You're making progress",
    "Superb",
    "You are doing well",
    "You are getting better",
    "Keep the momentum",
    "You're a star!",
    "Awsome job",
    "You're a champ",
  ];

  List neg_encourage = [
    "Oops!",
    "Try again!",
    "Not quite!",
    "Take your time",
    "Let's try this once again",
    "Observe and retry!",
    "Try a different angle",
    "Maybe learn from this",
    "Try harder",
    "Try to focus",
    "Try to concentrate",
    "Look at the rope",
    "Observe the alphabet",
    "One more try"
  ];

  late PageController _pageController;
  int _currentPage = 0;
  late FlutterTts _flutterTts;

  bool isTimerRunning = false;
  bool showStartButton = true;
  bool showRestartButton = false;
  bool allowNextStep = false;
  bool finished = false;
  int currentTime = 0;
  bool isTimerFinished = false;
  late AudioPlayer _audioPlayer;
  late Timer _timer; // Define the Timer object
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _flutterTts = FlutterTts();
    _audioPlayer = AudioPlayer();
    _confettiController = ConfettiController();
    _speakInstructions();
  }

  void startTimer(exerciseDuration) {
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
          finished = true;
          isTimerRunning = false;
          _confettiController.play();
          _audioPlayer.play(AssetSource('sound/ding.mp3'), volume: 0.5);
          timer.cancel();
          Future.delayed(Duration(seconds: 3), () {
            _confettiController.stop();
          });
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

  Future<void> _speakInstructions() async {
    String textToSpeak = widget.exercise['steps'][_currentPage]['audio text'];
    print(textToSpeak);
    await _flutterTts.setLanguage("en-AU");
    await _flutterTts.setPitch(1);
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(textToSpeak);
  }

  Future<void> _stopInstructions() async {
    await _flutterTts.stop();
  }

  Widget WrongPopup() {
    //pick a random neg_encourage

    int random = new DateTime.now().millisecondsSinceEpoch;
    int index = random % neg_encourage.length;
    _flutterTts.speak(neg_encourage[index]);
    return AlertDialog(
      contentPadding: EdgeInsets.all(16.0),
      content: Container(
        height: 200,
        child: Column(
          children: [
            const Text(
              "If you are not able to see the rope as double, slowly blink your eyes a few times and refocus",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Image.asset(
                "assets/img/brock_string/blinking.gif",
                width: 200,
                height: 100,
              ),
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
            const SizedBox(
                height:
                    16.0), // Add vertical spacing between question and options
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Adjust as needed
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      step['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (step['question']['correct option number'] == 1) {
                      if (isTimerRunning) {
                        _timer.cancel();
                      }
                      //randomly select an encouragement
                      int random = new DateTime.now().millisecondsSinceEpoch;
                      int index = random % encourage.length;
                      //_flutterTts.speak(encourage[index]);
                      //wait till the audio is finished
                      // Future.delayed(Duration(seconds: 2), () {
                      //   _stopInstructions();
                      // });
                      finished = false;
                      _moveToNextStep(stepIndex);

                      //stop timer
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
                      if (isTimerRunning) {
                        _timer.cancel();
                      }
                      finished = false;
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
    //currentTime = duration;
    if (duration == 0) {
      finished = true;
      allowNextStep = true;
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
                  style: const TextStyle(
                      fontSize: 16.0), // Adjust the font size as needed
                ),
              ),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    step['image'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                  height: 16.0), // Add vertical spacing between image and timer
              duration == 0
                  ? Container()
                  : Column(children: [
                      Center(
                        child: Text(
                          'Timer: $currentTime seconds',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (showStartButton)
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              startTimer(duration);
                            },
                            child: Text('Start Timer'),
                          ),
                        ),
                      if (showRestartButton)
                        Center(
                          child: ElevatedButton(
                            onPressed: restartTimer,
                            child: Text('Restart Timer'),
                          ),
                        ),
                      SizedBox(height: 20),
                      if (isTimerRunning)
                        Center(
                          child: const Text(
                            'Timer is Running...',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      // if (allowNextStep)
                      //   ElevatedButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         allowNextStep = false;
                      //         // Add logic to move to the next step/exercise
                      //         _moveToNextStep(_currentPage);
                      //       });
                      //     },
                      //     child: Text('Next Step'),
                      //   ),
                    ]),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        particleDrag: 0.05,
        emissionFrequency: 0.03,
        numberOfParticles: 15,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        child: Container(
            width: screenWidth,
            height: screenHeight - 100,
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
                        finished = false;
                        _speakInstructions();
                      },
                      children: [
                        for (int i = 0;
                            i < widget.exercise['steps'].length;
                            i++)
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
                          onPressed: allowNextStep &&
                                  !isTimerRunning &&
                                  finished &&
                                  !(widget.exercise['steps'][_currentPage]
                                          ['type'] ==
                                      'question')
                              ? _currentPage ==
                                      widget.exercise['No of steps'] - 1
                                  ? () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return CongratsScreen();
                                      }));
                                    }
                                  : () {
                                      if (_currentPage <
                                          widget.exercise['No of steps'] - 1) {
                                        allowNextStep = false;
                                        finished = false;
                                        if (isTimerRunning) {
                                          _timer.cancel();
                                        }
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
                                _currentPage ==
                                        widget.exercise['No of steps'] - 1
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
            )));
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _stopInstructions();
    _pageController.dispose();
    _audioPlayer.dispose();
    super.dispose();
    _timer.cancel();
  }
}
