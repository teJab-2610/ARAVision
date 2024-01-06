import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatMapWidget extends StatefulWidget {
  const HeatMapWidget({Key? key, required this.dates_done}) : super(key: key);

  final Map<DateTime, int> dates_done;

  @override
  _HeatMapWidgetState createState() => _HeatMapWidgetState();
}

class _HeatMapWidgetState extends State<HeatMapWidget> {
  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      datasets: widget.dates_done,
      colorsets: const {
        1: Color.fromARGB(20, 2, 179, 8),
        2: Color.fromARGB(40, 2, 179, 8),
        3: Color.fromARGB(60, 2, 179, 8),
        4: Color.fromARGB(80, 2, 179, 8),
        5: Color.fromARGB(100, 2, 179, 8),
        6: Color.fromARGB(120, 2, 179, 8),
        7: Color.fromARGB(140, 2, 179, 8),
        8: Color.fromARGB(160, 2, 179, 8),
        9: Color.fromARGB(180, 2, 179, 8),
      },
      colorMode: ColorMode.color,
      flexible: true,
      defaultColor: Colors.white,
      onClick: (DateTime? datetime) {
        //snackbar displays number of times it is done that day
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Exercise done ${widget.dates_done[datetime]} times on ${datetime!.day}/${datetime.month}/${datetime.year}",
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      },
    );
  }
}
