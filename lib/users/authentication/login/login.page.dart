import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/api_connection/api_connection.dart';
import 'package:health_hub_app/pages/home/home.page.dart';
import 'package:health_hub_app/users/authentication/signup/signup.page.dart';
import 'package:health_hub_app/users/model/user.dart';
import 'package:health_hub_app/users/userPreferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  loginUser() async {
    try {
      var res = await http.post(Uri.parse(API.login), body: {
        'user_email': emailController.text.trim(),
        'user_password': passwordController.text.trim(),
      });
      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin["accountFound"]) {
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);
          await RememberUserPrefs.storeUserInfo(userInfo);
          // ignore: use_build_context_synchronously
          Get.to(HomePage());

          Fluttertoast.showToast(
              msg: "Congratulations, you are logged-in successfully.");
        } else {
          Fluttertoast.showToast(msg: "Account not found, create one.");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff58e3c5), Color(0xffADFFEE)],
              begin: Alignment.topCenter),
        ),
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
                    borderRadius: BorderRadius.circular(40)),
                width: double.infinity,
                height: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 10.0, right: 10.0),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Email Required";
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w+\.])+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return "Email Format 'ismaildrissi@gmail.com'";
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xff58e3c5)), //<-- SEE HERE
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
                                  color: Color(0xff58e3c5)), //<-- SEE HERE
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            hintStyle: TextStyle(fontFamily: "Gilroy"),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            loginUser();
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
                            'Login',
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
                          Text("Create new account by "),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUpPage());
                            },
                            child: Text(
                              "Signing Up.",
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
