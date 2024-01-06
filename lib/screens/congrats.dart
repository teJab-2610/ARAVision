import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CongratsScreen extends StatefulWidget {
  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<CongratsScreen> {
  void initState() {
    super.initState();
    increaseTrackCount();
  }

  void increaseTrackCount() async {
    //save the date in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int trackCount = prefs.getInt('BrotrackCount') ?? 0;
    prefs.setString('BrotrackDate$trackCount', DateTime.now().toString());
    prefs.setInt('BrotrackCount', trackCount + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have completed the workout",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
