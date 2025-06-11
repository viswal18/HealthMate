import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:zynapsemed/constants/colors.dart'; // Ensure you import SColors properly

class Screendetectionresponse extends StatefulWidget {
  final String prompt;

  const Screendetectionresponse({super.key, required this.prompt});

  @override
  State<Screendetectionresponse> createState() =>
      _ScreendetectionresponseState();
}

class _ScreendetectionresponseState extends State<Screendetectionresponse> {
  String response = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchResponse();
  }

  Future<void> _fetchResponse() async {
    String fetchedResponse = await getresponse(widget.prompt);
    setState(() {
      response = fetchedResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DETECTION RESPONSE",
          style: TextStyle(color: SColors.fourth, fontWeight: FontWeight.w500),
        ),
        backgroundColor: SColors.second,
        iconTheme: IconThemeData(color: SColors.fourth),
      ),
      body: Container(
        color: SColors.third, // Background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: SColors.fourth,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    child: Text(
                      response,
                      style: TextStyle(
                          fontSize: 17,
                          color: SColors.first,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: SColors.second,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("Back",
                    style: TextStyle(color: SColors.fourth, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final apiKey = 'AIzaSyDjITFtAQCbQic17RKhQgtOHXxNEcU6tzc';

Future<String> getresponse(String prompt) async {
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  final msg = Content.text(prompt);
  final response = await model.generateContent([msg]);
  final cleanresponse = response.text?.replaceAll('*', '') ?? "No response";
  return cleanresponse;
}
