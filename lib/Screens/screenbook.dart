import 'package:flutter/material.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screenrehabbook extends StatefulWidget {
  Screenrehabbook({super.key});

  @override
  State<Screenrehabbook> createState() => _ScreenrehabbookState();
}

DateTime selectedDate = DateTime.now();

class _ScreenrehabbookState extends State<Screenrehabbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Book Appointments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: SColors.second,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                SColors.second),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            final DateTime? dateTime = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000),
                                initialDate: selectedDate);
                            if (dateTime != null) {
                              setState(() {
                                selectedDate = dateTime;
                              });
                            }
                          },
                          child: Text("Choose Date")),
                      Text(
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              width: 380,
              decoration: BoxDecoration(
                  color: SColors.third,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 207, 207)))),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Age",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 207, 207)))),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Phone no",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 207, 207)))),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Book Now"),
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
            ),
            Text("OR"),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Call now"),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
