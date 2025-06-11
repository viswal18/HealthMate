import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/symptomScreen.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screendisease extends StatefulWidget {
  const Screendisease({super.key});

  @override
  _ScreendiseaseState createState() => _ScreendiseaseState();
}

class _ScreendiseaseState extends State<Screendisease> {
  String? selectedAge;
  String? selectedGender;
  List<String> selectedConditions = [];
  String? takingMedication;

  final List<String> ageGroups = [
    "Child (0-12)",
    "Teenager (13-19)",
    "Adult (20-59)",
    "Senior (60+)"
  ];
  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> medicalConditions = [
    "Diabetes",
    "Hypertension",
    "Asthma",
    "Heart Disease",
    "None"
  ];
  final List<String> medicationOptions = ["Yes", "No"];

  Map<String, dynamic> userInput = {};

  void navigateToNextScreen() {
    userInput = {
      "Age Group": selectedAge ?? "Not selected",
      "Gender": selectedGender ?? "Not selected",
      "Medical Conditions": selectedConditions.isNotEmpty
          ? selectedConditions.join(", ")
          : "None",
      "Taking Medication": takingMedication ?? "Not selected",
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SymptomScreen(userInput: userInput),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HEALTH INFO",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: SColors.second,
        foregroundColor: SColors.fourth,
      ),
      backgroundColor: SColors.fourth,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Age Dropdown
            Text("Select Your Age Group"),
            DropdownButton<String>(
              value: selectedAge,
              isExpanded: true,
              items: ageGroups.map((String age) {
                return DropdownMenuItem<String>(
                  value: age,
                  child: Text(age),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAge = value;
                });
              },
            ),

            SizedBox(height: 16),

            // Gender Dropdown
            Text("Select Your Gender"),
            DropdownButton<String>(
              value: selectedGender,
              isExpanded: true,
              items: genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            SizedBox(height: 16),

            // Medical Conditions Dropdown
            Text("Select Your Medical Conditions"),
            Wrap(
              children: medicalConditions.map((condition) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(condition),
                    selected: selectedConditions.contains(condition),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedConditions.add(condition);
                        } else {
                          selectedConditions.remove(condition);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 16),

            // Medication Usage Dropdown
            Text("Are you currently taking any medication?"),
            DropdownButton<String>(
              value: takingMedication,
              isExpanded: true,
              items: medicationOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  takingMedication = value;
                });
              },
            ),

            SizedBox(height: 24),

            // Next Screen Button
            Center(
                child: ElevatedButton(
              onPressed: navigateToNextScreen,
              child: Text("Next"),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(SColors.second),
                foregroundColor: WidgetStatePropertyAll(SColors.fourth),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
