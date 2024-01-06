import 'package:aravision/common/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:aravision/screens/settingup.dart';

class SetupView extends StatelessWidget {
  final Map wObj;
  const SetupView({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                wObj["image"].toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.blue, // Set your desired background color here
              //   borderRadius:
              //       BorderRadius.circular(8), // Optional: Add border radius
              // ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Setting Up",
                      style: TextStyle(color: TColor.black, fontSize: 16),
                    ),
                    Text(
                      "Steps to get ready for doing the exercise",
                      style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),

                      ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Other children widgets...
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingUp(),
                      ));
                },
                icon: Image.asset(
                  "assets/img/next_icon.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ))
          ],
        ));
  }
}
