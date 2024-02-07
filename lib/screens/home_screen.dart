import 'package:flutter/material.dart';
import 'package:aravision/common/colors_extension.dart';
import '../../widgets/what_train_row.dart';
import 'package:aravision/screens/workout_detail_view.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static void navigateToExerciseDetail(BuildContext context, Map wObj) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutDetailView(dObj: wObj),
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List whatArr = [
    {
      "image": "assets/img/bstring.jpeg",
      "title": "BrockString Exercise",
      "exercises": "3 steps",
      "time": "15 mins",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FocusBro'),
        centerTitle: true,
        backgroundColor: TColor.primaryColor2,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: TColor.black,
        //   ),
        //   onPressed: () {
        //     //close app
        //     SystemNavigator.pop();
        //   },
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: TColor.gray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What Do You Want to Train",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: whatArr.length,
                itemBuilder: (context, index) {
                  var wObj = whatArr[index] as Map? ?? {};
                  return InkWell(
                    onTap: () {
                      HomeScreen.navigateToExerciseDetail(context, wObj);
                    },
                    child: WhatTrainRow(wObj: wObj),
                  );
                },
              ),
            ),
            SizedBox(height: media.width * 0.1),
          ],
        ),
      ),
    );
  }
}
