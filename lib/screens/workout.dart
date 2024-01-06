import 'package:flutter/material.dart';
import 'package:aravision/common/colors_extension.dart';
import 'package:aravision/widgets/workoutstep_details.dart';
import 'package:aravision/screens/process_details_screen.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  List exerciseList = [
    {
      "Name": "Single bead Exercise",
      "Time": "5 min",
      "Description":
          "The Brock string exercise is a vision therapy technique that uses a special string with colored beads to improve eye coordination and focusing. It's often used for people with conditions like convergence insufficiency, lazy eye, or strabismus.",
      "Repetitions": 3,
      "No of steps": 14,
      "steps": [
        {
          "type": "Instruction",
          "image": "assets/img/brock_string/step1.png",
          "audio text":
              "Now, that you are seated comfortably,Keep the bead at 1 metre and focus on it.",
          "Description": "Take a seat and keep the bead at one metre distance.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 0
        },
        {
          "type": "question",
          "image": "assets/img/brock_string/step2.jpg",
          "audio text":
              "As you are focusing on the bead, do you see the rope as double forming A shape. Are you able to see it?",
          "Description": "",
          "question": {
            "question": "Do you see the 'A' shape?",
            "options": ["Yes", "No"],
            "correct option number": 1,
          },
          "Timer": 0
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step3.jpg",
          "audio text":
              "Now, Focus on the bead for 20 seconds..... Good. You should be able to see the rope as double to proceed",
          "Description": "Focus on the bead for 20 seconds.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step4.png",
          "audio text":
              "Now move the bead 2 inches towards you.Blink your eyes 3 times and refocus on the bead so that the rope appears like a A.",
          "Description": "Move the bead 2 inches towards you.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 0
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step5.jpeg",
          "audio text":
              "Now, Focus on the bead for 20 seconds. While looking at the bead, make sure the rope is straight and in the centre between your eyes. Well done….18, 19, 20.",
          "Description": "Focus the bead.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step6.png",
          "audio text":
              "Now move the bead 2 inches towards you.Blink your eyes 3 times and refocus on the bead for 20 seconds. The rope will now appear like a shorter A. 1,2,3… excellent, both your eyes are fusing well.",
          "Description": "Move the bead towards.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step7.png",
          "audio text":
              "Move the bead forward. Refocus again. Count aloud to 20. Very good. You are gaining control of your squint.",
          "Description": "keep doing the exercise.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step8.png",
          "audio text":
              "Blink your eyes while the bead is being moved forward.Now fixate and 1,2,3,4,5,6,7,8...very good. Keep maintaing focus",
          "Description": "continue the exercise.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step9.png",
          "audio text":
              "Keep refixating on the bead that slowly moving towards you and refixate for 20 seconds. This might seem monotous but remember this will help keep your condition from worsening.",
          "Description": "Good Job ! You are getting there!",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "question",
          "image": "assets/img/brock_string/step10.jpg",
          "audio text":
              "You are now midway. The rope will seem to appear like an 'X' with the centre of the X at the bead. You are making excellent progress, Keep going and maintain your focus. Are you able to see the 'X'?",
          "Description":
              "You are midway now, the rope should appear like an 'X'?",
          "question": {
            "question": "Can You see 'X?",
            "options": ["Yes", "No"],
            "correct option number": 1,
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step11.gif",
          "audio text":
              "Remember to relax your eyes by blinking when the bead is being moved. Count aloud to 20.",
          "Description": "Getting there!",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step12.jpg",
          "audio text":
              "As you fixate on the bead you will notice that the rope now starts appearing more like a V.",
          "Description": "Your eyes will now get closer and closer.",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
        {
          "type": "question",
          "image": "assets/img/brock_string/step13.jpg",
          "audio text":
              "Observe the eye movements, they should be focused on the bead. See if one eye is moving out.",
          "Description": "The eyes should converge.",
          "question": {
            "question": "Is an eye moving out?",
            "options": ["Yes", "No"],
            "correct option number": 1,
          },
          "Timer": 20
        },
        {
          "type": "Exercise",
          "image": "assets/img/brock_string/step14.jpeg",
          "audio text":
              "You are now at the last point. Keep maintaining focus for 20 seconds. Kudos on improving your convergence.",
          "Description": "You completed the single bead Exercise!!",
          "question": {
            "question": "",
            "options": "",
            "correct option number": "",
          },
          "Timer": 20
        },
      ]
    }
  ];

  bool allready = false;

  Widget Popup() {
    return AlertDialog(
      title: Text("Are you ready?"),
      //content: Text("Are you ready to start the workout?"),
      actions: [
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              allready = true;
            });
          },
        ),
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout'),
        backgroundColor: TColor.secondaryColor1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: true
          ? Container(
              child: ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                return ExerciseDetailsScreen(exercise: exerciseList[index]);
              },
            ))
          : Popup(),
    );
  }
}
