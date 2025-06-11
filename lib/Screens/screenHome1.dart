import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenProfile.dart';
import 'package:zynapsemed/constants/colors.dart';
import 'package:zynapsemed/functions/list.dart';
import 'package:zynapsemed/model/model.dart';

class Screenhome1 extends StatelessWidget {
  const Screenhome1({super.key});

  @override
  Widget build(BuildContext context) {
    getalldata();
    return Scaffold(
      backgroundColor: SColors.fourth, // Soft background
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => Screenprofile()));
              },
              icon: Icon(Icons.person))
        ],
        title: Text(
          'MEDICATIONS',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: SColors.second,
        foregroundColor: SColors.fourth,
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: mednotifier,
        builder:
            (BuildContext context, List<model> patientlist, Widget? child) {
          if (patientlist.isEmpty) {
            return Center(
              child: Text(
                "No medications added",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: patientlist.length,
            itemBuilder: (context, index) {
              final medication = patientlist[index];
              return Card(
                color: SColors.fourth,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              medication.medicationname,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[900],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,
                                color:
                                    const Color.fromARGB(255, 167, 167, 167)),
                            onPressed: () => _confirmDelete(context, index),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.medical_services,
                              color: SColors.second, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Quantity: ${medication.quantity}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.repeat, color: SColors.second, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Frequency: ${medication.frequency}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              color: SColors.second, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Time: ${medication.time}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Medication"),
          content: Text("Are you sure you want to delete this medication?"),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Colors.grey[600])),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Delete",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 246, 125, 125))),
              onPressed: () {
                deletedata(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
