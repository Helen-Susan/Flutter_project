import 'package:flutter/material.dart';
import 'package:medical/widgets/button_down.dart';

class Alarmpage extends StatelessWidget {
  const Alarmpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 248, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 248, 255, 1),
        title: Text(
          "Medical_app",
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40), // Add padding to move content up
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "7:00 AM",
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.alarm,
                      size: 35.0,
                    )
                  ],
                ),
                Text(
                  "Medication",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Text("1 Tablet (500mg)"),
                Container(
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/8623/8623582.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                button(name: "Take Now"),
                SizedBox(height: 25.0),
                button(name: "Skipped"),
                SizedBox(height: 25.0),
                button(name: "Reschedule"),
                SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
