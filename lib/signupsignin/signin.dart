

import 'package:dailytask/Firebase/FirebaseAuthservices.dart';
import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:dailytask/signupsignin/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool showpass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Image(
                  image: AssetImage("assets/logo.jpeg"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7),
                child: const Text(
                  "Daily Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, // shadow blur
                        color: Colors.orange, // shadow color
                        offset:
                            Offset(2.0, 2.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),

                  controller: emailController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")), // Disallow whitespace
                  ],
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
                    hintText: "Enter Email",
                    filled: true,
                    prefixIcon: Image.asset("assets/user-profile.png"),
                    hintStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),

                  controller: passwordController,
                  obscureText: showpass, // Use passwordHidden here
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
                    hintText: "Enter Password",
                    prefixIcon: Image.asset("assets/security.png"),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        showpass ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toggle the state of passwordHidden variable
                        setState(() {
                          showpass = !showpass; // Toggle the state
                        });
                      },
                    ),
                    filled: true,
                    hintStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(68, 90, 100, 1.0),
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add onPressed callback if needed
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        // Show prompt if any field is empty
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Error",
                                style: TextStyle(color: Colors.amber),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(68, 90, 100, 1.0),
                              content: const Text(
                                "Please fill all fields",
                                style: TextStyle(color: Colors.amber),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // All fields are filled, proceed with sign up
                        // Add your sign-up logic here
                        Signin(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius as needed
                      ),
                      backgroundColor: Colors.amber,
                      minimumSize: const Size(310, 60),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: const Center(
                  child: Text(
                    "----------- or continue with ------------",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Add onPressed callback if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: const Size(310, 60),
                    elevation: 0, // Remove button elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/search.png"), // Add icon here
                      const SizedBox(
                          width: 10), // Add spacing between icon and text
                      const Text(
                        "Google",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?\t",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                          child: const Text("Sign up",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Signin(BuildContext c) async {
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await FirebaseAuthservices()
        .signInWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushReplacement(c, MaterialPageRoute(builder: (c) => const Homescreen()));
    } else {
      showUserNotFoundDialog(c);
    }
  }

  void showUserNotFoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
            const Color.fromRGBO(68, 90, 100, 1.0),

          title: const Text('User Not Found',

              style:
                  TextStyle(color: Colors.amber)),
          content: const Text('Please sign in to continue.',
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
