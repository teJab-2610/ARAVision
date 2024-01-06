import 'package:flutter/material.dart';

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
      "image": "assets/img/brock_string/intro.jpg"
    },
    {
      "title": "Glasses?",
      "instruction":
          "If you have glasses, you should wear them while doing the exercise",
      "image": "assets/img/brock_string/glasses.jpeg"
    },
    {
      "title": "Required",
      "instruction":
          "User a 3 meter brock string rope and tie one end to a window or a wall at seated eye level",
      "image": "assets/img/brock_string/settingup.jpg"
    },
    {
      "title": "Seating",
      "instruction": "Before starting make sure you are comfortable seated.",
      "image": "assets/img/brock_string/sitting.jpg"
    },
    {
      "title": "Required",
      "instruction":
          "Make sure the rope is taunt while doing the exercise. Don't use a slacked rope or place rope above/below your eye level",
      "image": "assets/img/brock_string/ropeateyelevel.jpg"
    },
    {
      "title": "Exercise",
      "instruction":
          "Whenever you focus on a bead try to look for the patterns like A, V or X to make sure you are doing it right way",
      "image": "assets/img/brock_string/pattern.jpg"
    },
    {
      "title": "Exercise",
      "instruction":
          "For every step, try to focus your gaze for atleast 20 seconds",
      "image": "assets/img/brock_string/focus.jpg"
    },
    {
      "title": "Exercise",
      "instruction":
          "In first stage of process, we try to focus on a bead at 3 different distances",
      "image": "assets/img/brock_string/beads4.jpg"
    },
    {
      "title": "Exercise",
      "instruction":
          "In next stage, we slowly move the bead from mount to closer to us and focus at different distances ",
      "image": "assets/img/singlebead.gif"
    },
    {
      "title": "Exercise",
      "instruction":
          "In last stage, we use three beads at different distance and try to shift our focus between three beads quickly",
      "image": "assets/img/brock_string/diff_view.gif"
    },
    {
      "title": "Caution",
      "instruction":
          "If you are not seeing the rope as double, it means one eye is supressed.",
      "image": "assets/img/brock_string/dominanteye.jpg"
    },
    {
      "title": "Caution",
      "instruction":
          "In such a case, slowly blink your eyes for a few times and try to refocus.",
      "image": "assets/img/brock_string/blinking.gif"
    },
    {
      "title": "Caution",
      "instruction":
          "If you feel any headache, please stop the session and try again",
      "image": "assets/img/brock_string/headache.gif"
    },
    {
      "title": "Caution",
      "instruction":
          "Do not stop the exercise in the middle or shift your focus to other things",
      "image": "assets/img/brock_string/landr.gif"
    },
  ];

  PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
        backgroundColor: _getAppBarColor(_currentPage),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
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
      return Colors.blue; // Blue background for titles containing 'Exercise'
    } else if (title.contains('caution')) {
      return Colors.red; // Red background for titles containing 'Caution'
    } else {
      return Colors.yellow; // Yellow background for other titles
    }
  }
}

class StepPage extends StatelessWidget {
  final String title;
  final String image;
  final String instructions;

  StepPage(this.title, this.image, this.instructions);

  @override
  Widget build(BuildContext context) {
    return Center(
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
              textAlign: TextAlign.center, // Center-align the instructions text
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
          ],
        ),
      ),
    );
  }
}
