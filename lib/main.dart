import 'dart:ui';

import 'package:flutter/material.dart';

final signupPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(145, 131, 222, 1),
  Color.fromRGBO(160, 148, 227, 1),
]);
final signupDarkPurple = Color.fromRGBO(82, 67, 154, 1);

final loginPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(229, 178, 202, 1),
  Color.fromRGBO(205, 130, 222, 1),
]);
final loginDarkPurple = Color.fromRGBO(120, 37, 139, 1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen Challenge',
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: signupPurpleGradient,
        ),
        child: Column(
          children: [
            HoverAnimation(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .584,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 45.0),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class HoverAnimation extends StatefulWidget {
  const HoverAnimation({Key? key}) : super(key: key);

  @override
  _HoverAnimationState createState() => _HoverAnimationState();
}

class _HoverAnimationState extends State<HoverAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.08),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/clouds.png"),
        SlideTransition(
          position: _animation,
          child: Image.asset("assets/images/rocket_person.png"),
        ),
      ],
    );
  }
}
