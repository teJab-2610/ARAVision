import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:aravision/common/colors_extension.dart';
import 'package:dotted_border/dotted_border.dart';

class SettingUp extends StatefulWidget {
  @override
  _SettingUpState createState() => _SettingUpState();
}

class _SettingUpState extends State<SettingUp> {
  List instructions = [
    {
      "title": "Intro",
      "instruction":
          "This exercise will help you train your eyes to focus together",
      "image": "assets/img/brock_string/intro.jpg",
      "note": ""
    },
    {
      "title": "Glasses?",
      "instruction":
          "If you have glasses, you should wear them while doing the exercise",
      "image": "assets/img/brock_string/glasses.jpeg",
      "note": ""
    },
    {
      "title": "Required",
      "instruction":
          "Initially use a 1 meter brock string rope and tie one end to a window or a wall at seated eye level",
      "image": "assets/img/brock_string/settingup.jpg",
      "note": ""
    },
    {
      "title": "Seating",
      "instruction": "Before starting make sure you are comfortably seated.",
      "image": "assets/img/brock_string/sitting.jpg",
      "note": ""
    },
    {
      "title": "Required",
      "instruction":
          "Make sure the rope is taut and straight at eye level while doing the exercise.",
      "image": "assets/img/brock_string/ropeateyelevel.jpg",
      "note": ""
    },
    // {
    //   "title": "Exercise",
    //   "instruction":
    //       "Whenever you focus on a bead try to look for the patterns like A, V or X to make sure you are doing it right way",
    //   "image": "assets/img/brock_string/pattern.jpg"
    // },
    // {
    //   "title": "Exercise",
    //   "instruction":
    //       "For every step, try to focus your gaze on the bead for atleast 20 seconds",
    //   "image": "assets/img/brock_string/focus.jpg"
    // },
    {
      "title": "Exercise",
      "instruction":
          "In second stage of process, we try to focus on a bead at 3 different distances",
      "image": "assets/img/brock_string/beads4.jpg",
      "note": ""
    },
    {
      "title": "Exercise",
      "instruction":
          "In next stage, we slowly move the bead from mount to closer to us and focus at different distances ",
      "image": "assets/img/singlebead.gif",
      "note": ""
    },
    {
      "title": "Exercise",
      "instruction":
          "In last stage, we use three beads at different distance and try to shift our focus between three beads quickly",
      "image": "assets/img/brock_string/diff_view.gif",
      "note": ""
    },
    {
      "title": "Caution",
      "instruction":
          "If you are not seeing the rope as double, it could mean one eye is supressed.",
      "image": "assets/img/brock_string/dominanteye.jpg",
      "note": ""
    },
    {
      "title": "Caution",
      "instruction":
          "In such a case, slowly blink your eyes for a few times and try to refocus.",
      "image": "assets/img/brock_string/blinking.gif",
      "note": ""
    },
    {
      "title": "Caution",
      "instruction":
          "If you feel any headache, please stop the session and try again after a while",
      "image": "assets/img/brock_string/headache.gif",
      "note": ""
    },
    {
      "title": "Caution",
      "instruction":
          "Do not stop the exercise in the middle or shift your focus to other things",
      "image": "assets/img/brock_string/landr.gif",
      "note":
          "Please make sure the person following this exercise isn't deviating from the exercise"
    },
  ];

  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();

    _flutterTts = FlutterTts();
    _speakInstructions(instructions[0]['instruction']);
  }

  @override
  void dispose() {
    _flutterTts.stop();
  }

  Future<void> _speakInstructions(text) async {
    print(text);
    await _flutterTts.setLanguage("en-us");
    await _flutterTts.setPitch(1);
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(text);
  }

  Future<void> _stopInstructions() async {
    await _flutterTts.stop();
  }

  PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Up'),
        backgroundColor: _getAppBarColor(_currentPage),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _speakInstructions(instructions[page]['instruction']);
                  _currentPage = page;
                });
              },
              itemCount: instructions.length,
              itemBuilder: (BuildContext context, int index) {
                final instruction = instructions[index];
                return StepPage(
                  instruction['title'],
                  instruction['image'],
                  instruction['instruction'],
                  instruction['note'],
                );
              },
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
                  child: Text('Previous'),
                ),
                Text('Step ${_currentPage + 1}'),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < instructions.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Last step reached, navigate back to the previous screen
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    _currentPage == instructions.length - 1 ? 'Finish' : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getAppBarColor(int currentPage) {
    String title = instructions[currentPage]['title'].toLowerCase();
    if (title.contains('exercise')) {
      return TColor
          .primaryColor1; // Blue background for titles containing 'Exercise'
    } else if (title.contains('caution')) {
      return TColor
          .secondaryColor1; // Red background for titles containing 'Caution'
    } else {
      return TColor.primaryColor2; // Yellow background for other titles
    }
  }
}

class StepPage extends StatelessWidget {
  final String title;
  final String image;
  final String instructions;
  final String note;

  StepPage(this.title, this.image, this.instructions, this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: Center(
        // Center the contents on the screen
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Center-align the title text
              ),
              SizedBox(height: 8),
              Text(
                instructions,
                style: TextStyle(fontSize: 16),
                textAlign:
                    TextAlign.center, // Center-align the instructions text
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Padding for the image
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              //dotteb box with text in it
              SizedBox(height: 20),
              if (note != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                    color: Colors.red,
                    strokeWidth: 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Note to helper: \n" + note,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
