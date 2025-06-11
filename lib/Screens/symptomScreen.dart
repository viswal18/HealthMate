import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/lifestyleScreen.dart';
import 'package:zynapsemed/constants/colors.dart';

class SymptomScreen extends StatefulWidget {
  final Map<String, dynamic> userInput;

  const SymptomScreen({super.key, required this.userInput});

  @override
  _SymptomScreenState createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  String? primarySymptom;
  String? secondarySymptom;
  String? symptomDuration;

  final List<String> symptoms = [
    "Fever",
    "Cough",
    "Fatigue",
    "Headache",
    "Shortness of breath",
    "Nausea"
  ];
  final List<String> durations = [
    "Less than a day",
    "1-3 days",
    "More than a week",
    "More than a month"
  ];

  void navigateToNextScreen() {
    Map<String, dynamic> updatedUserInput = {
      ...widget.userInput,
      "Primary Symptom": primarySymptom ?? "Not selected",
      "Secondary Symptom": secondarySymptom ?? "Not selected",
      "Symptom Duration": symptomDuration ?? "Not selected",
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LifestyleScreen(userInput: updatedUserInput),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SYMPTOM DETAILS",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        foregroundColor: SColors.fourth,
        backgroundColor: SColors.second,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Your Primary Symptom"),
            DropdownButton<String>(
              value: primarySymptom,
              isExpanded: true,
              items: symptoms.map((String symptom) {
                return DropdownMenuItem<String>(
                  value: symptom,
                  child: Text(symptom),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  primarySymptom = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text("Select Your Secondary Symptom"),
            DropdownButton<String>(
              value: secondarySymptom,
              isExpanded: true,
              items: symptoms.map((String symptom) {
                return DropdownMenuItem<String>(
                  value: symptom,
                  child: Text(symptom),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  secondarySymptom = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text("How long have you had these symptoms?"),
            DropdownButton<String>(
              value: symptomDuration,
              isExpanded: true,
              items: durations.map((String duration) {
                return DropdownMenuItem<String>(
                  value: duration,
                  child: Text(duration),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  symptomDuration = value;
                });
              },
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: navigateToNextScreen,
                child: Text("Next"),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(SColors.second),
                  foregroundColor: WidgetStatePropertyAll(SColors.fourth),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
