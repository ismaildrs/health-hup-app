import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/users/userPreferences/current_user.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Color(0xff58e3c5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5), color: Color(0xffebecee), blurRadius: 3),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 50,
            child: Text(
              ">>Swipe",
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 20,
                fontFamily: "Gilroy-Bold",
              ),
            ),
          ),
          Positioned(
            bottom: 58,
            left: 22,
            child: Text(
              'HELLO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Gilroy-Light',
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 22,
            child: Text(
              _currentUser.user.user_name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: 'Gilroy-Bold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
