import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/pages/home/widgets/header.home.dart';
import 'package:health_hub_app/pages/home/widgets/menu.home.dart';
import 'package:health_hub_app/pages/home/widgets/options.home.dart';
import 'package:health_hub_app/users/userPreferences/current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  final CurrentUser _currentUser = Get.put(CurrentUser());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState: (currentState) {
          _rememberCurrentUser.getUserInfo();
        },
        builder: (controller) {
          return Scaffold(
            drawer: Drawer(
              backgroundColor: Color(0xff58e3c5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/profile_pic.png"),
                            ),
                            shape: BoxShape.circle),
                        height: 170,
                      ),
                      Divider(
                        color: Colors.white,
                        height: 30,
                      ),
                      Text(
                        '${_currentUser.user.user_name.toUpperCase()} ${_currentUser.user.user_surname.toUpperCase()}',
                        style: TextStyle(
                            fontFamily: "Gilroy-Bold",
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Text(
                        _currentUser.user.user_email.toLowerCase(),
                        style: TextStyle(
                          fontFamily: "Gilroy-Bold",
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "HEALTH HUB",
                      style: TextStyle(
                          fontFamily: "Gilroy-Bold",
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [HomeHeader(), OptionsField()],
            ),
            bottomNavigationBar: MenuField(),
          );
        });
  }
}
