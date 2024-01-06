import 'package:aravision/common/colors_extension.dart';
import 'package:aravision/widgets/icon_title_next_row.dart';
import 'package:aravision/widgets/setup.dart';
import 'package:aravision/widgets/round_button.dart';
// import 'package:aravision/view/workout_tracker/exercises_stpe_details.dart';
// import 'package:aravision/view/workout_tracker/workout_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:aravision/widgets/video_player.dart';
import 'package:aravision/screens/exercise_steps.dart';
import 'package:aravision/screens/workout.dart';
//import '../widgets/exercises_set_section.dart';
import 'package:aravision/screens/tracker_screen.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailView({super.key, required this.dObj});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  late int _expandedIndex;
  String language = 'English';
  final Key _videoPlayerKey = UniqueKey();
  Widget _buildLanguageWidget() {
    print("inside switch");
    print(language);
    switch (language) {
      case 'தமிழ்':
        return _buildTamilWidget();
      case 'తెలుగు':
        return _buildTeluguWidget();
      default:
        return VideoPlayerWidget(
            videoUrl: 'https://youtu.be/y0Y1Az-y6KE?feature=shared',
            isYoutube: true,
            key: _videoPlayerKey);
    }
  }

  Widget _buildEnglishWidget() {
    return const VideoPlayerWidget(
        // videoUrl: widget.dObj["video"] != null
        //     ? widget.dObj["video"].toString()
        //     : "",
        videoUrl: 'https://www.youtube.com/watch?v=Yynbw1A5tfs',
        isYoutube: true);
  }

  Widget _buildTamilWidget() {
    return const VideoPlayerWidget(
        // videoUrl: widget.dObj["video"] != null
        //     ? widget.dObj["video"].toString()
        //     : "",
        videoUrl: 'https://www.youtube.com/watch?v=Yynbw1A5tfs',
        isYoutube: true);
  }

  Widget _buildTeluguWidget() {
    return const VideoPlayerWidget(
        // videoUrl: widget.dObj["video"] != null
        //     ? widget.dObj["video"].toString()
        //     : "",
        videoUrl: 'https://www.youtube.com/watch?v=FM7zzX7xK74',
        isYoutube: true);
  }

  List youArr = [
    {"image": "assets/img/brock-string.jpeg", "title": "Brock String"},
  ];

  List images = [
    "assets/img/picture-A.jpg",
    "assets/img/picture-V.jpg",
    "assets/img/picture-X.jpg",
  ];

  List stepArr = [
    {
      "no": "01",
      "title": "Set the bead",
      "detail":
          "Keep all the beads towards the mounted end except one bead at 1 meter distance"
    },
    {
      "no": "02",
      "title": "Observe",
      "detail":
          "Focus on that one bead. When properly observed we see an A shape forming at the string. Focus on the bead for 20 seconds"
    },
    {
      "no": "03",
      "title": "Move the bead",
      "detail": "Now move the bead 2 inches closer towards you."
    },
    {
      "no": "04",
      "title": "Refocus on the bead",
      "detail":
          "Blink your eyes 3 times and refocus on the bead so that the rope appears like a A. FOcus for 20 seconds"
    },
    {
      "no": "05",
      "title": "Continue above steps",
      "detail":
          "Keep moving the bead 2 inches close and try to focus on it for 20 seconds and observe the changing letter patterns"
    },
    {
      "no": "06",
      "title": "Look for Below Images",
      "detail":
          "As you start the bead from far position, you will see A which gradually changes to X and then to V as the bead moves closer."
    },
  ];

  List exercisesArr = [
    {
      "image": "assets/img/img_1.png",
      "title": "Single bead exercise",
      "value": "10:00",
      "description":
          "In this part of exercise, you push all the beads to mounted side and use only one bread. Starting from one end, gradually move the bead towards yourself and practice conversion on it.",
    },
    {
      "image": "assets/img/img_2.png",
      "title": "Three bead exercise",
      "value": "3:00;",
      "description": "This is three bead exercise."
    }
  ];
  String video1 = "assets/img/singlebead.gif";
  String video2 = "assets/img/threebead.gif";
  int currentExerciseIndex = -1; // Initialize to -1 for no exercise selected

  void navigateToExerciseDetail(String exercise_name, String description) {
    // Navigate to the exercise detail page using Navigator
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExercisesStepDetails(
                stepArr: stepArr,
                video: video1,
                exerciseName: exercise_name,
                images: images,
                description: description,
              )),
    ).then((value) {
      setState(() {
        currentExerciseIndex = -1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    int exercise_index = 0;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: TColor.lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/img/black_btn.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle the selected option
                    if (value == 'tracker') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HeatMapScreen()));
                    } else if (value == 'feedback') {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FeedbackScreen()));
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'tracker',
                      child: Text('Tracker'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'feedback',
                      child: Text('Feedback'),
                    ),
                  ],
                ),
              ],
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.3,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/brockstring_cover.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: TColor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()}",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/time.png",
                          title: "Schedule Workout",
                          time: "5/27, 09:00 AM",
                          color: TColor.primaryColor2.withOpacity(0.3),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const WorkoutScheduleView()));
                          }),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Items",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: youArr.length,
                            itemBuilder: (context, index) {
                              var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: media.width * 0.35,
                                        width: media.width * 0.35,
                                        decoration: BoxDecoration(
                                            color: TColor.lightGray,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          yObj["image"].toString(),
                                          width: media.width * 0.2,
                                          height: media.width * 0.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          yObj["title"].toString(),
                                          style: TextStyle(
                                              color: TColor.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      // SizedBox(
                      //   height: media.width * 0.02,
                      // ),

                      //horizontal line

                      const SizedBox(height: 20),
                      const SetupView(
                        wObj: {
                          "image": "assets/img/pic_4.png",
                          "title": "Drinking 300ml Water",
                          "time": "About 1 minutes ago"
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercise Video",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          DropdownButton<String>(
                            value: language,
                            onChanged: (String? newValue) {
                              print("value changed");
                              setState(() {
                                language = newValue!;
                                print(language);
                              });
                            },
                            items: <String>['English', 'தமிழ்', 'తెలుగు']
                                .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildLanguageWidget(),

                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        height: 1,
                        width: double.infinity,
                        color: TColor.gray.withOpacity(0.3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: exercisesArr.length,
                        itemBuilder: (context, index) {
                          var eObj = exercisesArr[index];
                          return GestureDetector(
                            onTap: () {
                              navigateToExerciseDetail(
                                  eObj["title"].toString(),
                                  eObj["description"]
                                      .toString()); // Trigger navigation to exercise detail
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eObj["title"].toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      1, // Since each exercise has only one item in this scenario
                                  itemBuilder: (context, _) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              eObj["image"].toString(),
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  eObj["title"].toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  eObj["value"].toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              navigateToExerciseDetail(
                                                  eObj["title"].toString(),
                                                  eObj["description"]
                                                      .toString());
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20), // Adjust as needed
                              ],
                            ),
                          );
                          //exerciseIndex++;
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(
                          title: "Start Workout",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Workout()),
                            );
                          }),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
