import 'package:doc_talk/variables.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = "";

  createcode() {
    setState(() {
      code = Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Create an unique code and share with your doctor / patient to start!",
              style: mystyle(20, Colors.blueGrey[700], FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Your Meeting Code: ',
                style: mystyle(20, Colors.cyan[800]),
              ),
              Text(
                code,
                style: mystyle(20, Colors.red, FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => createcode(),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  "Create Code",
                  style: mystyle(20, Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
