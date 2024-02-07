import 'package:aravision/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:aravision/common/colors_extension.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import '../../widgets/heat_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeatMapScreen extends StatefulWidget {
  const HeatMapScreen({Key? key}) : super(key: key);

  @override
  _HeatMapScreenState createState() => _HeatMapScreenState();
}

class _HeatMapScreenState extends State<HeatMapScreen> {
  Map<DateTime, int> dates_done = {
    DateTime(2024, 1, 1): 10,
    DateTime(2024, 1, 2): 4,
    DateTime(2024, 1, 4): 6,
    DateTime(2024, 1, 6): 2,
    DateTime(2024, 1, 7): 4,
  };
  //Map<DateTime, int> dates_done = {};
  //get the shared preferences BrotrackCount and map it to dates_done
  //they are initially saved in this way
  // int trackCount = prefs.getInt('BrotrackCount') ?? 0;
  //   prefs.setString('BrotrackDate$trackCount', DateTime.now().toString());
  //   prefs.setInt('BrotrackCount', trackCount + 1);
  void getDates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int trackCount = prefs.getInt('BrotrackCount') ?? 0;
    for (int i = 0; i < trackCount; i++) {
      String date = prefs.getString('BrotrackDate$i') ?? "";
      dates_done[DateTime.parse(date)] = 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tracker",
          style: TextStyle(color: TColor.black),
        ),
        backgroundColor: TColor.primaryColor2,
        elevation: 0,
        centerTitle: true,
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
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          HeatMapWidget(dates_done: dates_done),
          const SizedBox(
            height: 16,
          ),
          //show number of days the exercise is done that month
          Text(
            "Exercise done ${dates_done.length} days this month",
            style: TextStyle(color: TColor.black),
          ),
          const SizedBox(
            height: 10,
          ),
          // RoundButton(
          //   title: "Clear History",
          //   elevation: 0.05,
          //   onPressed: () {
          //     setState(() {
          //       dates_done.clear();
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
