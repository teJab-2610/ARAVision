import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';

import 'package:aravision/common/colors_extension.dart';

class WorkoutStepDetailRow extends StatefulWidget {
  final Map wsObj;
  final bool isLast;
  const WorkoutStepDetailRow(
      {super.key, required this.wsObj, this.isLast = false});
  @override
  _WorkoutStepDetailRowState createState() => _WorkoutStepDetailRowState();
}

class _WorkoutStepDetailRowState extends State<WorkoutStepDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          child: Text(
            widget.wsObj["no"].toString(),
            style: TextStyle(
              color: TColor.secondaryColor1,
              fontSize: 14,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: TColor.secondaryColor1,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: TColor.white, width: 3),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            if (!widget.isLast)
              DottedDashedLine(
                  height: 50,
                  width: 0,
                  dashColor: TColor.secondaryColor1,
                  axis: Axis.vertical)
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.wsObj["stage"],
          style: TextStyle(
            color: TColor.secondaryColor1,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.wsObj["title"],
                style: TextStyle(
                  color: TColor.secondaryColor1,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.wsObj["desc"],
                style: TextStyle(
                  color: TColor.secondaryColor1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
