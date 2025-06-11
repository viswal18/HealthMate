import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenbook.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screenappointment extends StatelessWidget {
  const Screenappointment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doctorDetails = [
      {"name": "Dr. Rithul", "subtitle": "Senior Consultant"},
      {"name": "Dr. Smitha", "subtitle": "Counsellor"},
      {"name": "Dr. Rajesh", "subtitle": "Mental Health Specialist"},
      {"name": "Dr. Priya", "subtitle": "Psychiatrist"},
      {"name": "Dr. John", "subtitle": "Senior Consultant"},
      {"name": "Dr. Anjali", "subtitle": "Alcohol and Drug Councellor"},
      {"name": "Dr. Arun", "subtitle": "Senior Consultant"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SColors.second,
        foregroundColor: Colors.white,
        title: Text(
          "Find your doctor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 380,
          height: 650,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/profile-user.png'),
                ),
                title: Text(doctorDetails[index]["name"]!),
                subtitle: Text(doctorDetails[index]["subtitle"]!),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => Screenrehabbook()));
                  },
                  child: Text("Appointment"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(SColors.second),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                style: ListTileStyle.list,
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider(
                thickness: 2,
              );
            },
            itemCount: doctorDetails.length, // Number of items in the list
          ),
        ),
      ),
    );
  }
}
