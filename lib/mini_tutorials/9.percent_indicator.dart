import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Percent extends StatefulWidget {
  const Percent({super.key});

  @override
  State<Percent> createState() => PercentState();
}

class PercentState extends State<Percent> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Percent Indicators")),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 10.0,
              percent: 0.8,
              header: const Text("Icon header"),
              center: const Icon(
                Icons.person_pin,
                size: 50.0,
                color: Colors.blue,
              ),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            h16,
            CircularPercentIndicator(
              radius: 60.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.4,
              center: const Text(
                "40 hours",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.yellow,
              progressColor: Colors.red,
            ),
            h16,
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: const Text(
                "70.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: const Text(
                "Sales this week",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
            h16,
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: const Text("100%"),
              progressColor: Colors.green,
            ),
            h16,
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.10,
                    center: const Text("10%"),
                    progressColor: Colors.red,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.30,
                    center: const Text("30%"),
                    progressColor: Colors.orange,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.60,
                    center: const Text("60%"),
                    progressColor: Colors.yellow,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.90,
                    center: const Text("90%"),
                    progressColor: Colors.green,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: const Text(
                  "50.0%",
                  style: TextStyle(fontSize: 12.0),
                ),
                trailing: const Icon(Icons.mood),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: const Text("left content"),
                trailing: const Text("right content"),
                percent: 0.2,
                center: const Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: const Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: const Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.2,
                    progressColor: Colors.red,
                  ),
                  LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.5,
                    progressColor: Colors.orange,
                  ),
                  LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.9,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
