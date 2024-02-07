import 'package:aravision/common/colors_extension.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  static const String id = 'feedback_screen';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report"),
          backgroundColor: TColor.primaryColor1,
        ),
        body: Scaffold());
  }
}
