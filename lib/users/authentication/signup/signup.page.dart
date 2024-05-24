import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:health_hub_app/api_connection/api_connection.dart';
import 'package:health_hub_app/users/authentication/login/login.page.dart';
import 'package:health_hub_app/users/model/user.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _value = 0;
  String _genderType = '';

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final surnameController = TextEditingController();

  final genderController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final dateController = TextEditingController();

  validateUserEmail() async {
    try {
      var res = await http.post(Uri.parse(API.validateEmail), body: {
        'user_email': emailController.text.trim()
      }); //response from the server
      if (res.statusCode == 200) {
        //from flutter the connection with api to server
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail["emailFound"]) {
          Fluttertoast.showToast(
              msg: "Email is already used. Try another email.");
        } else {
          saveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  saveUserRecord() async {
    User userModel = User(
        nameController.text.trim(),
        surnameController.text.trim(),
        _genderType.trim(),
        emailController.text.trim(),
        passwordController.text.trim());

    try {
      var res =
          await http.post(Uri.parse(API.signUp), body: userModel.toJson());
      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp["success"]) {
          Fluttertoast.showToast(
              msg: "Congratulations, you signed up successfully.");
        } else {
          Fluttertoast.showToast(msg: "Error Ocurred, Try Again.");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff58e3c5),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'HEALTH HUB',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: "Gilroy-Bold"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 10.0, right: 10.0),
                              child: TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Name Required";
                                  }
                                  if (!RegExp(r'^[a-z A-Z]+$')
                                      .hasMatch(value)) {
                                    return "Name should contains only letters";
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color(0xff58e3c5)), //<-- SEE HERE
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Firstname',
                                  hintStyle: TextStyle(fontFamily: "Gilroy"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 10.0, right: 10.0),
                              child: TextFormField(
                                controller: surnameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Surname Required";
                                  }
                                  if (!RegExp(r'^[a-z A-Z]+$')
                                      .hasMatch(value)) {
                                    return "Surname should contains only letters";
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color(0xff58e3c5)), //<-- SEE HERE
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Lastname',
                                  hintStyle: TextStyle(fontFamily: "Gilroy"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 10.0, right: 10.0),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Email Required";
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w+\.])+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return "Email Format 'ismaildrissi@gmail.com'";
                                  }
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color:
                                              Color(0xff58e3c5)), //<-- SEE HERE
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(fontFamily: "Gilroy")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 10.0, right: 10.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Password Required";
                                  }
                                  if (value.length < 8) {
                                    return "Password must 8 or above";
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            Color(0xff58e3c5)), //<-- SEE HERE
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontFamily: "Gilroy"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Male",
                                        style: TextStyle(fontFamily: "Gilroy"),
                                      ),
                                      Radio(
                                        activeColor: Color(0xff58e3c5),
                                        value: 1,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                            _genderType = "Male";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Female",
                                        style: TextStyle(fontFamily: "Gilroy"),
                                      ),
                                      Radio(
                                        activeColor: Color(0xff58e3c5),
                                        value: 2,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                            _genderType = "Female";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  validateUserEmail();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff58e3c5),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 50,
                                width: 120,
                                margin: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "Gilroy-Bold",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("if you already signed up, "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    "login directly.",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
