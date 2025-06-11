import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenHome1.dart';
import 'package:zynapsemed/constants/colors.dart';
import 'package:zynapsemed/functions/list.dart';
import 'package:zynapsemed/model/model.dart';

class Screenaddmed extends StatefulWidget {
  const Screenaddmed({super.key});

  @override
  State<Screenaddmed> createState() => _ScreenaddmedState();
}

class _ScreenaddmedState extends State<Screenaddmed> {
  final _formKey = GlobalKey<FormState>();
  String medicationName = '';
  String quantity = '';
  String frequency = '';
  String medicationTime = ''; // String for time, later converted to DateTime

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        medicationTime = pickedTime.format(context);
        print("Selected Time: $medicationTime"); // Debug print
      });
    }
  }

  // Function to clear text fields
  void _clearTextFields() {
    setState(() {
      medicationName = '';
      quantity = '';
      frequency = '';
      medicationTime = '';
      _nameController.clear();
      _quantityController.clear();
      _frequencyController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.fourth,
      appBar: AppBar(
        title: Text('Add Medication Details'),
        backgroundColor: SColors.second,
        foregroundColor: SColors.fourth,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController, // Add controller
                      decoration: InputDecoration(
                        labelText: 'Medication Name',
                        labelStyle: TextStyle(color: SColors.first),
                        filled: true,
                        fillColor: SColors.fourth,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter medication name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        medicationName = value;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _quantityController, // Add controller
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(color: SColors.first),
                        filled: true,
                        fillColor: SColors.fourth,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter quantity';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        quantity = value;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _frequencyController, // Add controller
                      decoration: InputDecoration(
                        labelText: 'Frequency (times per day)',
                        labelStyle: TextStyle(color: SColors.first),
                        filled: true,
                        fillColor: SColors.fourth,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter frequency';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        frequency = value;
                      },
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _selectTime(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Medication Time',
                            labelStyle: TextStyle(color: SColors.first),
                            hintText: medicationTime.isEmpty
                                ? 'Select Time'
                                : medicationTime,
                            filled: true,
                            fillColor: SColors.fourth,
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (medicationTime.isEmpty) {
                              return 'Please select a time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Add the medication
                          addmodel(model(
                              medicationname: medicationName,
                              quantity: quantity,
                              frequency: frequency,
                              time: medicationTime));

                          // Clear the text fields
                          _clearTextFields();

                          // Navigate to the home screen
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => Screenhome1()));
                        }
                      },
                      child: Text('Add Medication'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: SColors.second,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
