import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Screenprofile extends StatelessWidget {
  const Screenprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Medical Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfo(),
              SizedBox(height: 20),
              _buildMedicalPieChart(context), // Pass context here
              SizedBox(height: 20),
              _buildTextData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: Rithul", style: _infoTextStyle()),
            Text("Age: 30", style: _infoTextStyle()),
            Text("Blood Group: O+", style: _infoTextStyle()),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalPieChart(BuildContext context) {
    // Data for the pie chart (using average values for representation)
    Map<String, double> dataMap = {
      "Blood Pressure": 125.0, // Average of BP
      "Sugar Levels": 100.0, // Average of Sugar Levels
      "Cholesterol": 200.0, // Average of Cholesterol
      "CBC": 5.0, // Average of CBC
    };

    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Medical Data Overview", style: _infoTextStyle()),
            SizedBox(height: 10),
            PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width /
                  1.7, // Updated radius calculation
              colorList: [Colors.blue, Colors.green, Colors.orange, Colors.red],
              chartValuesOptions: ChartValuesOptions(showChartValues: true),
              animationDuration: Duration(seconds: 1),
              chartType: ChartType.ring,
              ringStrokeWidth:
                  32, // Optional: Make the ring thicker for better visibility
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfessionalText(
            "Blood Pressure", "120-130 mmHg (Normal Range: 90-120 mmHg)"),
        _buildProfessionalText(
            "Sugar Levels", "90-110 mg/dL (Normal Range: 70-100 mg/dL)"),
        _buildProfessionalText(
            "Cholesterol", "180-200 mg/dL (Normal Range: <200 mg/dL)"),
        _buildProfessionalText("CBC",
            "4.5-5.5 million cells/mcL (Normal Range: 4.2-5.4 million cells/mcL)"),
      ],
    );
  }

  Widget _buildProfessionalText(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(color: Colors.grey[400]),
        ],
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }
}
