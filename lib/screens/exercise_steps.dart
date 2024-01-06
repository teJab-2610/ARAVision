import 'package:aravision/widgets/step_detailrow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:aravision/common/colors_extension.dart';
import 'package:aravision/widgets/round_button.dart';
import 'package:aravision/common/colors_extension.dart';

class ExercisesStepDetails extends StatefulWidget {
  final List stepArr;
  final String exerciseName;
  final List images;
  final String video;
  final String description;
  const ExercisesStepDetails(
      {super.key,
      required this.stepArr,
      required this.exerciseName,
      required this.images,
      required this.video,
      required this.description});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  // String description =
  //     "In this part of exercise, you push all the beads to mounted side and use only one bread. Starting from one end, gradually move the bead towards yourself and practice conversion on it.";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var stepArr = widget.stepArr;
    var exercise_name = widget.exerciseName;
    String description = widget.description;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
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
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      widget.video,
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  exercise_name,
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              // Text(
              //   widget.eObj["title"].toString(),
              //   style: TextStyle(
              //       color: TColor.black,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w700),
              // ),
              const SizedBox(
                height: 4,
              ),
              // Text(
              //   "Easy | 390 Calories Burn",
              //   style: TextStyle(
              //     color: TColor.gray,
              //     fontSize: 12,
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Descriptions",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                description,
                trimLines: 4,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More ...',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     "${stepArr.length} Sets",
                  //     style: TextStyle(color: TColor.gray, fontSize: 12),
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr.length,
                itemBuilder: ((context, index) {
                  var sObj = stepArr[index] as Map? ?? {};

                  return StepDetailRow(
                    sObj: sObj,
                    isLast: stepArr.last == sObj,
                  );
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              Center(child: Text("Swipe for more images")),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
