import 'package:doc_talk/variables.dart';
import 'package:doc_talk/videoconference/createmeeting.dart';
import 'package:doc_talk/videoconference/meeting.dart';
import 'package:flutter/material.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  buildtab(String name) {
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(
            name,
            style: mystyle(15, Colors.black, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        title: Text(
          "DocTalk",
          style: mystyle(25, Colors.white, FontWeight.w700),
        ),
        bottom: TabBar(
          controller: tabcontroller,
          tabs: [buildtab("Join Meeting"), buildtab("Create Meeting")],
        ),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: [
          JoinMeeting(),
          CreateMeeting(),
        ],
      ),
    );
  }
}
