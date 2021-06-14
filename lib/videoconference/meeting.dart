import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_talk/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String fullname = '';

  @override
  void initState() {
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      fullname = userdoc['full name'];
    });
  }

  joinmeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (Platform.isAndroid) {
        featureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: roomcontroller.text)
        // ..room = roomcontroller.text
        ..userDisplayName =
            namecontroller.text == '' ? fullname : namecontroller.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(featureflags);

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "Room Code",
                style: mystyle(20, Colors.cyan[800]),
              ),
              SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                controller: roomcontroller,
                appContext: context,
                length: 6,
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: namecontroller,
                style: mystyle(20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name (Leave empty to use your full name",
                  labelStyle: mystyle(15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    isVideoMuted = value;
                  });
                },
                title: Text(
                  "Turn off Video",
                  style: mystyle(18, Colors.black, FontWeight.w400),
                ),
              ),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value) {
                  setState(() {
                    isAudioMuted = value;
                  });
                },
                title: Text(
                  "Turn off Microphone",
                  style: mystyle(18, Colors.black, FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("You can also Customize in your settings in the meeting.",
                  style: mystyle(15), textAlign: TextAlign.center),
              Divider(
                height: 48,
                thickness: 2.0,
              ),
              InkWell(
                onTap: () => joinmeeting(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Text(
                      "Join Meeting",
                      style: mystyle(20, Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
