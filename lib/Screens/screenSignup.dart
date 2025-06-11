import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenHomeBranch.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screencreateaccount extends StatelessWidget {
  Screencreateaccount({super.key});
  final _formkeysignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.third,
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: SColors.second,
        foregroundColor: SColors.fourth,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Form(
            key: _formkeysignup,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      hintText: "First Name",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 207, 207, 207)))),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Invalid Input";
                    else
                      return null;
                  },
                ), //firstname
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      hintText: "Last Name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 207, 207, 207)))),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Invalid Input";
                    else
                      return null;
                  },
                ), //Lastname
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      hintText: "e-mail",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 207, 207, 207)))),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Invalid Input";
                    else
                      return null;
                  },
                ), //email
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 207, 207, 207)))),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Invalid Input";
                    else
                      return null;
                  },
                ), //pass
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      hintText: "Phone No",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 207, 207, 207)))),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Invalid Input";
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkeysignup.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (builder) => Screenhomebranch()));
                      print("signup fine");
                    }
                  },
                  child: Text("Sign up"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(SColors.second),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ) //phonenum
              ],
            ),
          ),
        ),
      ),
    );
  }
}
