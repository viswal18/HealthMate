import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screendetectionresponse.dart';
import 'package:zynapsemed/constants/colors.dart';
import 'package:zynapsemed/functions/geminifunctions.dart';

class LifestyleScreen extends StatefulWidget {
  final Map<String, dynamic> userInput;

  const LifestyleScreen({super.key, required this.userInput});

  @override
  _LifestyleScreenState createState() => _LifestyleScreenState();
}

class _LifestyleScreenState extends State<LifestyleScreen> {
  String? recentlyTraveled;
  String? contactWithSick;
  String? traveledToArea;

  final List<String> yesNoOptions = ["Yes", "No"];

  void generatePrompt() {
    String prompt = """
    User Information:
    - Age Group: ${widget.userInput['Age Group']}
    - Gender: ${widget.userInput['Gender']}
    - Medical Conditions: ${widget.userInput['Medical Conditions']}
    - Taking Medication: ${widget.userInput['Taking Medication']}
    - Primary Symptom: ${widget.userInput['Primary Symptom']}
    - Secondary Symptom: ${widget.userInput['Secondary Symptom']}
    - Symptom Duration: ${widget.userInput['Symptom Duration']}
    
    Lifestyle Information:
    - Recently Traveled: ${recentlyTraveled ?? "Not selected"}
    - Contact with Sick People: ${contactWithSick ?? "Not selected"}
    - Traveled to High-Risk Area: ${traveledToArea ?? "Not selected"}
    Based on this info seperately generate
    the chances of having different diseases,
    methods to overcome,
    and immediate measures to be taken
    summarize and easy to understand
    """;

    print(prompt);
    // This will print the prompt string
    Navigator.of(context).push(MaterialPageRoute(
        builder: (builder) => Screendetectionresponse(prompt: prompt)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LIFESTYLE INFO",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: SColors.second,
        foregroundColor: SColors.fourth,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recently Traveled Dropdown
            Text("Have you recently traveled?"),
            DropdownButton<String>(
              value: recentlyTraveled,
              isExpanded: true,
              items: yesNoOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  recentlyTraveled = value;
                });
              },
            ),

            SizedBox(height: 16),

            // Contact with Sick People Dropdown
            Text("Have you been in contact with sick people recently?"),
            DropdownButton<String>(
              value: contactWithSick,
              isExpanded: true,
              items: yesNoOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  contactWithSick = value;
                });
              },
            ),

            SizedBox(height: 16),

            // Traveled to High-Risk Area Dropdown
            Text("Have you traveled to a high-risk area recently?"),
            DropdownButton<String>(
              value: traveledToArea,
              isExpanded: true,
              items: yesNoOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  traveledToArea = value;
                });
              },
            ),

            SizedBox(height: 24),

            // Generate Prompt Button
            Center(
              child: ElevatedButton(
                onPressed: generatePrompt,
                child: Text("Submit"),
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
