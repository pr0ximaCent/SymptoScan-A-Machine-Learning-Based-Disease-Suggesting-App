import 'package:flutter/material.dart';
import 'package:symptoscan/CreateAccount.dart';
import 'package:symptoscan/HomeScreen.dart';
import 'package:symptoscan/Methods.dart';
import 'package:symptoscan/LoginScreen.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: size.height / 10,
                    width: size.width / 1.2,
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.3,
                    child: Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: size.width / 1.3,
                      child: Text(
                        "Sign In to Continue!",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(
                        size, "E-mail Address", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Password", Icons.lock, _password),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  customButton(size),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CreateAccount())),
                    child: Text(
                      "Create Account!",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Successful!!!");
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              print("Login Failed.");
              setState(() {
                isLoading = false;
              });

              // Show a dialog with an error message
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Login Failed'),
                    content: Text('Please enter correct Email Address and Password.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }

          });
        } else {
          print("Please fill up all details!");
          setState(() {
            isLoading = false;
          });

          // Show a dialog with an error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Validation Error'),
                content: Text('Please fill up all details!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }

      },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.blue),
        child: Text("Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.3,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

