import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/users/authentication/login/login.page.dart';
import 'package:health_hub_app/users/userPreferences/current_user.dart';
import 'package:health_hub_app/users/userPreferences/user_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  double? _deviceWidth, _deviceHeight;
  signOutUser() async {
    var resResp = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.black26,
        title: Center(
          child: const Text(
            "LogOut",
            style: TextStyle(
                color: Colors.red, fontFamily: "Gilroy-Medium", fontSize: 16),
          ),
        ),
        content: Text(
          "Do you want to logout from the application?",
          style: TextStyle(
              color: Colors.white, fontFamily: "Gilroy", fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "No",
              style: TextStyle(color: Colors.red, fontFamily: "Gilroy-Bold"),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontFamily: "Gilroy"),
            ),
          ),
        ],
      ),
    );

    if (resResp == "loggedOut") {
      RememberUserPrefs.removeUserInfo().then((value) => Get.off(LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      color: Color(0xff58e3c5),
      child: Column(
        children: [
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontFamily: "Gilroy-Bold", fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: _deviceHeight! * 0.35,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: _deviceHeight! * 0.27,
                  width: _deviceWidth,
                  color: Color(0xffc29dc4),
                ),
                Positioned(
                    left: 140,
                    top: 150,
                    height: 120,
                    width: 120,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_pic.png"),
                    )),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  '${_currentUser.user.user_name.toUpperCase()} ${_currentUser.user.user_surname.toUpperCase()}',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Gilroy-Bold",
                      color: Colors.white),
                ),
                Text(
                  _currentUser.user.user_email,
                  style: TextStyle(fontSize: 15, fontFamily: "Gilroy"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(children: [
              Center(
                child: Positioned(
                  bottom: 100,
                  child: GestureDetector(
                      onTap: () {
                        signOutUser();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        height: 50,
                        width: 100,
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: Color(0xff58e3c5),
                              fontSize: 18,
                              fontFamily: "Gilroy-Bold"),
                        ),
                      )),
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
