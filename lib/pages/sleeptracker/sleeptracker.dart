import 'package:flutter/material.dart';
import 'package:health_hub_app/pages/home/widgets/menu.home.dart';
import 'package:health_hub_app/pages/sleeptracker/sleeptracker.widgets/sleepchart.widget.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {
  List<double> weeklySleep = [8, 7, 9, 6, 9, 8, 7.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff58e3c5), Color(0xffADFFEE)],
              begin: Alignment.topCenter),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text('sleep schedule for 7 days'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy-Bold',
                    fontSize: 20),
                textAlign: TextAlign.center),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 350,
              child: MyBarGraph(),
            ),
            Expanded(
              child: SizedBox(),
            ),
            MenuField()
          ],
        ),
      ),
    );
  }
}
