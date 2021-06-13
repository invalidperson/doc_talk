import 'package:doc_talk/authentication/navigateauthscreen.dart';
import 'package:doc_talk/variables.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to DocTalk",
            body: "Stay Connected to your doctor, no matter wherever you are!",
            image: Center(
              child: Image.asset('images/welcome.png'),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(30, Colors.indigo[500]),
            ),
          ),
          PageViewModel(
            title: "Join or Start Meeting with your Doctor!",
            body: "Easy, Convenient and reliable!",
            image: Center(
              child: Image.asset('images/conference.png'),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(30, Colors.indigo[500]),
            ),
          ),
          PageViewModel(
            title: "Your Data is always protected!",
            body:
                "We are using jitsi meet, an opensource reliable backend for your data to be secured!",
            image: Center(
              child: Image.asset('images/Secured.png'),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(30, Colors.indigo[500]),
            ),
          ),
        ],
        onDone: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
        },
        onSkip: () {},
        showSkipButton: true,
        skip: const Icon(Icons.skip_next, size: 45),
        next: const Icon(Icons.arrow_forward_ios),
        done: Text(
          "Done",
          style: mystyle(20, Colors.black),
        ));
  }
}
