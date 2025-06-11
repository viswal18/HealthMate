import 'package:flutter/material.dart';
import 'package:zynapsemed/Screens/screenHome1.dart';
import 'package:zynapsemed/Screens/screenHomeBranch.dart';
import 'package:zynapsemed/Screens/screenSignup.dart';
import 'package:zynapsemed/constants/colors.dart';

class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.second,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: SColors.second,
              child: const Padding(
                padding: EdgeInsets.only(top: 150, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Text(
                      "Welcome to HealthMate",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: SColors.fourth,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "e-mail",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Input";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true, // Hide password
                        decoration: const InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Input";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Screenhomebranch()),
                            );
                          }
                        },
                        child: const Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SColors.first,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Screencreateaccount()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: SColors.first),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
