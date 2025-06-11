import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenLogin.dart';

class Screensplash extends StatefulWidget {
  const Screensplash({super.key});

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  @override
  void initState() {
    // TODO: implement initState
    splash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOADING"),
      ),
    );
  }
}

Future<void> splash(BuildContext context) async {
  await Future.delayed(Duration(seconds: 2));
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (builder) => Screenlogin()));
}
