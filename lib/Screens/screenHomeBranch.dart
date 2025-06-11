import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenAddmed.dart';
import 'package:zynapsemed/Screens/screenAppointment.dart';
import 'package:zynapsemed/Screens/screenDisease.dart';
import 'package:zynapsemed/Screens/screenHome1.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screenhomebranch extends StatefulWidget {
  const Screenhomebranch({super.key});

  @override
  State<Screenhomebranch> createState() => _ScreenhomebranchState();
}

class _ScreenhomebranchState extends State<Screenhomebranch> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenList = [
      Screenhome1(),
      Screendisease(),
      Screenappointment(),
      Screenaddmed()
    ];
    return Scaffold(
      body: screenList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .shifting, // Ensures proper background rendering
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        backgroundColor:
            Color.fromARGB(255, 255, 253, 244), // Set cream color here
        selectedItemColor: SColors.second,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat_auto_outlined), label: "Disease-det"),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_available_outlined), label: "Appoint"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined), label: "Add-med"),
        ],
      ),
    );
  }
}
